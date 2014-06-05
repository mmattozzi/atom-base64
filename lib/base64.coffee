module.exports =
  activate: ->
    atom.workspaceView.command "base64:encode", => @encode()
    atom.workspaceView.command "base64:decode", => @decode()

  encode: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()
    selection.insertText(new Buffer(selection.getText()).toString("base64"),
      { "select": true})

  decode: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()
    selection.insertText(new Buffer(selection.getText(), "base64").toString("utf8"),
      { "select": true})
