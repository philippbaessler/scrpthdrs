# gadget ui is created correctly

    Code
      create_gadget_ui()
    Output
      <div class="gadget-container">
        <div class="gadget-scroll">
          <div class="gadget-content">
            <div class="gadget-absfill" style="position: absolute; top:20px;right:20px;bottom:20px;left:20px;;">
              <style type="text/css">.ui-container{position:relative;width:420px;margin-left:auto;margin-right:auto}.ui-container>*{margin-left:0px}.ui-container>:last-child{margin-right:0px}.ui-inline>*{display:inline-block;margin-right:15px;margin-bottom:10px}.ui-inline>:last-child{margin-right:0px}#ui_switcher{margin-top:15px}.switch{display:inline-block}.switch label{padding-left:0}.switch span{position:relative;display:block;padding-top:6px;padding-left:14px;width:115px;height:34px;background:#fff;border-radius:4px;overflow:hidden;transition:color 0.2s ease;-webkit-user-select:none;-ms-user-select:none;user-select:none;border:1px solid #ccc;color:rgba(0,0,0,0);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}.switch span:before{content:"large";position:absolute;left:58px;width:52px;text-align:center;top:6px;transition:opacity 0.2s ease;color:black}.switch span:after{content:"small";position:absolute;padding:8px 0;width:55px;height:32px;line-height:14px;background:#337ab7;border-radius:3px;left:0px;top:0px;text-align:center;box-shadow:0px 0px 5px -2px black;transition:all 0.3s ease;color:#fff;border:1px solid #2e6da4}.switch input[type='checkbox']{cursor:none;position:absolute;margin-left:0;opacity:0}.switch input[type='checkbox']:checked+span:after{content:"large";left:58px;color:#fff;width:55px}.switch input[type='checkbox']:checked+span:before{right:auto;left:58px;opacity:0}.switch input[type='checkbox']:checked+span{color:black}</style>
              <div class="flexfill-container flexfill-container-column" style="display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;width:100%;height:100%;">
                <div class="flexfill-item" style="position:relative;-webkit-flex:none;-ms-flex:none;flex:none; height:auto;width:100%;">
                  <div class="toggle-switch">
                    <label class="switch">
                      <div class="form-group shiny-input-container">
                        <div class="checkbox">
                          <label>
                            <input id="toggle_size_large" type="checkbox" class="shiny-input-checkbox"/>
                            <span>small</span>
                          </label>
                        </div>
                      </div>
                    </label>
                  </div>
                </div>
                <div class="flexfill-item" style="position:relative;-webkit-flex:none;-ms-flex:none;flex:none; height:auto;width:100%;">
                  <div class="ui-container ui-inline">
                    <div class="form-group shiny-input-container" style="width:200px;">
                      <label class="control-label" id="txt_author-label" for="txt_author">Author</label>
                      <input id="txt_author" type="text" class="shiny-input-text form-control" value=""/>
                    </div>
                    <div class="form-group shiny-input-container" style="width:200px;">
                      <label class="control-label" id="txt_email-label" for="txt_email">Email</label>
                      <input id="txt_email" type="text" class="shiny-input-text form-control" value=""/>
                    </div>
                  </div>
                </div>
                <div class="flexfill-item" style="position:relative;-webkit-flex:1;-ms-flex:1;flex:1;width:100%;height:100%;">
                  <div class="flexfill-item-inner" style="position:absolute;top:0;left:0;right:0;bottom:0;">
                    <div class="tabbable">
                      <ul class="nav nav-hidden shiny-tab-input" id="ui_switcher" data-tabsetid="7157">
                        <li class="active">
                          <a href="#tab-7157-1" data-toggle="tab" data-bs-toggle="tab" data-value="ui_small"></a>
                        </li>
                        <li>
                          <a href="#tab-7157-2" data-toggle="tab" data-bs-toggle="tab" data-value="ui_large"></a>
                        </li>
                      </ul>
                      <div class="tab-content" data-tabsetid="7157">
                        <div class="tab-pane active" data-value="ui_small" id="tab-7157-1"></div>
                        <div class="tab-pane" data-value="ui_large" id="tab-7157-2">
                          <div class="ui-container">
                            <div class="ui-inline">
                              <div class="form-group shiny-input-container" style="width:200px;">
                                <label class="control-label" id="txt_header-label" for="txt_header">Header</label>
                                <input id="txt_header" type="text" class="shiny-input-text form-control" value=""/>
                              </div>
                              <div class="form-group shiny-input-container" style="width:200px;">
                                <div class="checkbox">
                                  <label>
                                    <input id="cb_include_script_title" type="checkbox" class="shiny-input-checkbox"/>
                                    <span>Include file name</span>
                                  </label>
                                </div>
                              </div>
                            </div>
                            <div class="form-group shiny-input-container" style="width: 420px;">
                              <label class="control-label" id="txt_description-label" for="txt_description">Description</label>
                              <textarea id="txt_description" class="shiny-input-textarea form-control" style="width:100%;height:100px;resize:none;"></textarea>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="flexfill-item" style="position:relative;-webkit-flex:none;-ms-flex:none;flex:none; height:auto;width:100%;">
                  <button class="btn btn-default action-button btn-primary" id="bt_insert" style="float:right;" type="button">insert</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

