global["main"] = function() {
  h$run(h$mainZCMainzimain);
}

global["countWord"] = function(s) {
  var o = { input: s };
  var action = h$c2( h$ap1_e
                   , h$mainZCMainzicountWord
                   , h$c1(h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e, o)
                   )
  h$runSync(action, false);
  return o.output;
}
