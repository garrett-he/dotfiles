Describe 'module env'
    Include lib/env.sh
    Describe 'function shell_name'
        It 'should return name of current shell.'
            When call env::shell_name
            The stdout should eq $(basename $(readlink /proc/$$/exe))
        End
    End

    Describe 'function ostype'
        It 'should return "linux" on Linux systems.'
            OSTYPE='linux-gnu'
            When call env::ostype
            The stdout should eq 'linux'
        End
        It 'should return "darwin" on macOS systems.'
            OSTYPE='darwin22.0'
            When call env::ostype
            The stdout should eq 'darwin'
        End
        It 'should return "cygwin" on Cygwin systems.'
            OSTYPE='cygwin'
            When call env::ostype
            The stdout should eq 'cygwin'
        End
        It 'should return "msys" on MSYS2 systems.'
            OSTYPE='msys'
            When call env::ostype
            The stdout should eq 'msys'
        End
    End
End
