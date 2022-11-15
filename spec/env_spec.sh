Describe 'module env'
    Include lib/env.sh
    Describe 'function shell_name'
        It 'should return name of current shell.'
            When call env::shell_name
            The stdout should eq $(basename $(readlink /proc/$$/exe))
        End
    End
End
