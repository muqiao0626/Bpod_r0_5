% Example state matrix: Trigger the sound server

sma = NewStateMatrix();

sma = AddState(sma, 'Name', 'TriggerSound', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'Delay'},...
    'OutputActions', {'Serial1Code', 5}); % Code 5 plays 5.wav from SD card
sma = AddState(sma, 'Name', 'Delay', ...
    'Timer', .2,...
    'StateChangeConditions', {'Tup', 'AbortSound'},...
    'OutputActions', {});
sma = AddState(sma, 'Name', 'AbortSound', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'exit'},...
    'OutputActions', {'Serial1Code', 255}); % Code 255 aborts the current sound