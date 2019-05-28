# ToolTipControl

ToolTipControl is a framework that shows a tooltip with particular information from an API.

### Usage
1. Right-click on your root project node in the project navigator and choose Add Files.... In the file chooser, navigate and select ToolTipControl.xcodeproj. Click Add to add ToolTipControl.xcodeproj as a sub-project.

Link the framework into your app by dragging ToolTipControl.framework into the Embedded Binaries of your app target.

Go to your main view controller or wherever you want the tooltip to appear and import the ToolTipControl.

Select a view on your app which will be the source view of the tooltip.

Make an instance of PopTip(), the main view controller of the tooltip.
```
let controller = PopTip()
```
Call showToolTip(onItem:) on your instance passing in the view that you want your tooltip to be attached to.
```
controller.showToolTip(onItem: <your voew>)
```
Present your poptip instance
```
present(controller, animated: true)
```

### API

This app uses this [dummy API](https://dummyapi.io/api/post?limit=1) to provide the details for the tooltip.

