"""
""" RUNNER BEFORE / AFTER HOOKS
"""
fu! BeforeHook()
  wall
endfunction

fu! AfterHook()
  wall
  "print this just for peace of mind
  echo ":wall"
endfunction
