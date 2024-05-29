Class AngularTemplate.Demo.Demo Extends %pkg.isc.rest.model.resource
{
    
    Parameter RESOURCENAME = "demo";

    /// Defines a mapping of actions available for this model class to the associated methods and arguments.
    XData ActionMap [ XMLNamespace = "http://www.intersystems.com/_pkg/isc/rest/action" ]
    {
    <actions>
        <action name="demo-call" method="GET" call="RunDemo" target="class" />
    </actions>
    }

    ClassMethod RunDemo() As AngularTemplate.rest.Model.SimpleResponse
    {
        set response = ##class(AngularTemplate.rest.Model.SimpleResponse).%New()
        set response.Message = "Hello World from IRIS!"
        quit response
    }

    ClassMethod CheckPermission(pID As %String, pOperation As %String, pUserContext As %RegisteredObject, ByRef URLParams) As %Boolean
    {
        Quit $IsObject(pUserContext) && (pOperation = $$$OperationAction("demo-call"))
    }

}