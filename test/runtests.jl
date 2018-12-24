
using TimedAutomata, Test

testrun = TMARun(
    TMA(
        [
            [0,0],
            [0,1],
            [1,0],
            [1,1]
        ], 
        [], 
        2, 
        [
            TMATransition([0,0],[0,1],:a,[1],@condition true),
            TMATransition([0,1],[1,0],:b,[2],@condition true),
            TMATransition([1,0],[1,1],:c,[],@condition c[1] < 1.0),
            TMATransition([1,1],[0,0],:d,[],@condition c[2] > 2.0),
        ], 
        [0,0]
    ), 
    [
        (2.0,:a),
        (2.7,:b),
        (2.8,:c),
        (5.0,:d)
    ])


@test collect(testrun) == [
    RunState([0, 0], [3.0, 2.3]),
    RunState([0, 1], [3.0, 2.3]),
    RunState([1, 0], [3.0, 2.3]),
    RunState([1, 1], [3.0, 2.3]),
    RunState([0, 0], [3.0, 2.3])
]