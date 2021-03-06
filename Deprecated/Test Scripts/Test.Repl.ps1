CLS
. PSUnit.ps1
import-module Repl -force

#function Test.Get-ReplServer([switch] $Skip)
function Test.Get-ReplServer([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplServer "$env:computername\sql2K8"
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'ReplicationServer'}
}

#function Test.Get-ReplLightPublication([switch] $Skip)
function Test.Get-ReplLightPublication([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = get-repllightpublication "$env:computername\sql2K8"
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'LightPublication'}
}

function Test.Get-replSubscriberSubscription([switch] $Skip)
#function Test.Get-replSubscriberSubscription([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = get-replSubscriberSubscription "$env:computername\sql2K8"
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'SubscriberSubscription'}
}

#function Test.Get-ReplPublication([switch] $Skip)
function Test.Get-ReplPublication([switch] $Category_GetRepl)
{
    #Arrange
    $a = ,(get-ReplPublication "$env:computername\sql2K8")
    #Act
    $Actual = $a[0]
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'TransPublication'}
}

#function Test.Get-ReplSubscription([switch] $Skip)
function Test.Get-ReplSubscription([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublication "$env:computername\sql2K8" | Get-ReplSubscription
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'TransSubscription'}
}

#function Test.Get-ReplArticle([switch] $Skip)
function Test.Get-ReplArticle([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = (Get-ReplPublication "$env:computername\sql2K8" | Get-ReplArticle)[0]
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'TransArticle'}
}

#function Test.Get-ReplMonitor([switch] $Skip)
function Test.Get-ReplMonitor([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplMonitor "$env:computername\sql2K8"
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'ReplicationMonitor'}
}

#function Test.Get-ReplPublisherMonitor([switch] $Skip)
function Test.Get-ReplPublisherMonitor([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublisherMonitor "$env:computername\sql2K8"
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'PublisherMonitor'}
}

#function Test.Get-ReplPublicationMonitor([switch] $Skip)
function Test.Get-ReplPublicationMonitor([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublicationMonitor "$env:computername\sql2K8"
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'PublicationMonitor'}
}

#function Test.Get-ReplEnumPublications([switch] $Skip)
function Test.Get-ReplEnumPublications([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublisherMonitor "$env:computername\sql2K8" | Get-ReplEnumPublications
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'DataRow'}
}

#function Test.Get-ReplEnumPublications2([switch] $Skip)
function Test.Get-ReplEnumPublications2([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublisherMonitor "$env:computername\sql2K8" | Get-ReplEnumPublications2
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'DataRow'}
}

#function Test.Get-replEnumSubscriptions([switch] $Skip)
function Test.Get-replEnumSubscriptions([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublicationMonitor "$env:computername\sql2K8" | Get-replEnumSubscriptions
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'DataRow'}
}

#function Test.Get-replEnumSubscriptions2([switch] $Skip)
function Test.Get-replEnumSubscriptions2([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublicationMonitor "$env:computername\sql2K8" | Get-replEnumSubscriptions2
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'DataRow'}
}

#function Test.Get-ReplTransPendingCommandInfo([switch] $Skip)
function Test.Get-ReplTransPendingCommandInfo([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublicationMonitor "$env:computername\sql2K8" | Get-ReplTransPendingCommandInfo
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'PendingCommandInfo'}
}

#function Test.Get-replenumlogreaderagent([switch] $Skip)
function Test.Get-replenumlogreaderagent([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublicationMonitor "$env:computername\sql2K8" | Get-replenumlogreaderagent
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'DataRow'}
}

#function Test.Get-replenumsnapshotagent([switch] $Skip)
function Test.Get-replenumsnapshotagent([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplPublicationMonitor "$env:computername\sql2K8" | Get-replenumsnapshotagent
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'DataRow'}
}

#function Test.Get-replscript([switch] $Skip)
function Test.Get-replscript([switch] $Category_GetRepl)
{
    #Arrange
    #Act
    $Actual = Get-ReplServer "$env:computername\sql2K8" | Get-replscript
    Write-Debug $Actual
    #Assert
    Assert-That -ActualValue $Actual -Constraint {$ActualValue.GetType().Name -eq 'String'}
}