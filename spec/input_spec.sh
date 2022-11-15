Include lib/env.sh

Describe 'module input'
    Include lib/input.sh

    Describe 'function input::read'
        It 'should set specified variables from input.'
            Data
                #|test input
                #|
            End
            When call input::read 'Input test' test_var
            The variable test_var should eq 'test input'
        End


        It 'should set default value to variables if input none.'
            Data
                #|
            End

            When call input::read 'Input test' test_var default_value
            The variable test_var should eq 'default_value'
        End
    End

    Describe 'function input::confirm'
        It 'should be success if input "y".'
            Data
                #|y
            End

            When call input::confirm 'Confirm test'
            The status should be success
        End

        It 'should be failure if input "n".'
            Data
                #|n
            End

            When call input::confirm 'Confirm test'
            The status should be failure
        End
    End
End
