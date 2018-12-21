# kdenlive-dev

## for MLT

- ensure movit compositing is always occuring on a thread managed with mlt
- ensure all threads managed by mlt can be delegated to the application for setup, tear down.
  - Q: thread hooks per????
- the get_frame API, unless explicitly required, delegates to a managed worker thread.
- be explicit in docs as to the potential cost of get_frame. Encourage async solutions where immediate
display is not required.

## for kdenlive

- clip properties updates async
- clip thumbnails update async?
  - these are *currently* safe as all possible Clips do not require GL
  - QuartzComposer
