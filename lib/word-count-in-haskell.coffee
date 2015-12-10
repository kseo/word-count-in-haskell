WordCountInHaskellView = require './word-count-in-haskell-view'
{CompositeDisposable} = require 'atom'

module.exports = WordCountInHaskell =
  wordCountInHaskellView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @wordCountInHaskellView = new WordCountInHaskellView(state.wordCountInHaskellViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @wordCountInHaskellView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'word-count-in-haskell:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @wordCountInHaskellView.destroy()

  serialize: ->
    wordCountInHaskellViewState: @wordCountInHaskellView.serialize()

  toggle: ->
    console.log 'WordCountInHaskell was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
