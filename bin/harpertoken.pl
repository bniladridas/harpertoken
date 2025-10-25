#!/usr/bin/env perl

use strict;
use warnings;
use Cwd;
use File::Spec;
use File::Path qw(make_path);

sub check_docker {
    my $result = system('docker --version >/dev/null 2>&1');
    return $result == 0;
}

sub run_mega_linter {
    my $cwd     = getcwd();
    my $command = qq{docker run --rm -v "$cwd":/tmp/lint }
      . qq{oxsecurity/megalinter:latest};
    print "Running code quality checks...\n";
    my $result = system($command);
    if ( $result != 0 ) {
        die "Error running mega-linter\n";
    }
    print "Code quality checks completed.\n";
}

sub install_hooks {
    my $cwd       = getcwd();
    my $hooks_dir = File::Spec->catdir( $cwd, '.git', 'hooks' );
    if ( !-d $hooks_dir ) {
        die "Not a git repository. Please run in a git repo.\n";
    }

    my $pre_commit = File::Spec->catfile( $hooks_dir, 'pre-commit' );
    open my $fh, '>', $pre_commit or die "Cannot write to $pre_commit: $!\n";
    print $fh "#!/bin/sh\nharpertoken\n";
    close $fh;

    system("chmod +x '$pre_commit'");
    print
"Pre-commit hook installed. Code quality checks will run on every commit.\n";
}

my $arg = shift @ARGV;

if ( defined $arg && $arg eq '--install' ) {
    install_hooks();
}
else {
    if ( !check_docker() ) {
        die "Docker is not installed. Please install Docker "
          . "to use harpertoken.\n";
    }
    run_mega_linter();
}
