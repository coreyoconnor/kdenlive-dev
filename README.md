# kdenlive-dev

## for MLT

- ensure movit compositing is always occuring on a thread managed with mlt
- ensure all threads managed by mlt can be delegated to the application for setup, tear down.
  - Q: thread hooks per????
- the get_frame API, unless explicitly required, delegates to a managed worker thread.
- related: change the real_time API. Separate real time (completes within known, constant real time)
  from frame dropping (drops frames if necessary) and parallel rendering (uses multiple threads).
- implied: fail if using multiple threads, GL, and no thread management hooks.
- implied: document requirement that real time plus no multi threading requires a valid GL context
  for application's use of MLT (get frame specifically).
- be explicit in docs as to the potential cost of get_frame. Encourage solutions that share frame
  data.

## for kdenlive

- clip properties updates async
- clip thumbnails update async
  - these are *currently* safe as all possible Clips do not require GL
  - QuartzComposer
