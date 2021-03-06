function Get-ConnectionInfo
{
param($bitmap)
 New-Grid -Columns 2 -Rows 7 -width 428 -height 220 {
      $script:Action = {
        $tns = $window | Get-ChildControl tns
        $userName = $window | Get-ChildControl UserName
        $password = $window | Get-ChildControl Password
        $dbaPrivilege = $window | Get-ChildControl dbaPrivilege

        $this.Parent.Parent.Tag = (New-Object PSObject -Property @{
            tns = [string]$tns.Text
            UserName = [string]$userName.Text
            Password = [string]$Password.Text
            dbaPrivilege = [string] ( '', 'SYSDBA', 'SYSOPER')[$dbaPrivilege.SelectedIndex]
        })
        $window.Close()
    }
    
    new-image -source $bitmap -ColumnSpan 2 -Width 400 -Height 40 -HorizontalAlignment Left
    
    New-Label -Row 1 "TNS name (required):" -VerticalContentAlignment 'Center' -FontWeight Bold
    New-TextBox -Row 1 -Column 1 -Name tns -Width 200 -Height 20 -HorizontalAlignment Left
    
    New-Label -Row 2 "User name (required):" -VerticalContentAlignment 'Center'
    New-TextBox -Row 2 -Column 1 -Name UserName -Width 200 -Height 20  -HorizontalAlignment Left
    
    New-Label -Row 3 "Password: (required)" -VerticalContentAlignment 'Center'
    New-TextBox -Row 3 -Column 1 -Name Password -Width 200 -Height 20  -HorizontalAlignment Left

    New-ComboBox -SelectedIndex 0 -Row 4 -Column 1 -Name dbaPrivilege -Width 200 -Height 20 -HorizontalAlignment Left {'normal','as sysdba', 'as sysoper'}
    
    New-Separator -Row 5 -ColumnSpan 2
    
    New-StackPanel -Orientation horizontal -Row 6 -Column 1 -HorizontalAlignment Right {
        New-Button -Name Connect "Connect" -Row 6  -On_Click $action -Width 75 -Height 25
        New-Button -Name Cancel "Cancel" -Row 6 -Column 1 -On_Click {$window.Close()} -Width 75 -Height 25
    }
    
} -show
}

