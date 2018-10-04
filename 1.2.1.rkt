;;; #lang racket DON'T USE THIS
;;; (define noun-list (list 'dog 'cat 'student 'professor 'book 'computer))
(define noun-list (list 'dog 'cat 'student 'professor 'book 'computer 'time 'year 'people 'way 'day 'man 'thing 'woman 'life 'child 'world 'school 'state 'family 'student 'group 'country 'problem 'hand 'part 'place 'case 'week 'company 'system 'program 'question 'work 'government 'number 'night 'point 'home 'water 'room 'mother 'area 'money 'story 'fact 'month 'lot 'right 'study 'book 'eye 'job 'word 'business 'issue 'side 'kind 'head 'house 'service 'friend 'father 'power 'hour 'game 'line 'end 'member 'law 'car 'city 'community 'name 'president 'team 'minute 'idea 'kid 'body 'information 'back 'parent 'face 'others 'level 'office 'door 'health 'person 'art 'war 'history 'party 'result 'change 'morning 'reason 'research 'girl 'guy 'moment 'air 'teacher 'force 'education))
;;; (define verb-list (list 'ran 'ate 'slept 'drank 'exploded 'decomposed))
(define verb-list (list 'ran 'ate 'slept 'drank 'exploded 'decomposed 'be 'have 'do 'say 'go 'can 'get 'would 'make 'know 'will 'think 'take 'see 'come 'could 'want 'look 'use 'find 'give 'tell 'work 'may 'should 'call 'try 'ask 'need 'feel 'become 'leave 'put 'mean 'keep 'let 'begin 'seem 'help 'talk 'turn 'start 'might 'show 'hear 'play 'run 'move 'like 'live 'believe 'hold 'bring 'happen 'must 'write 'provide 'sit 'stand 'lose 'pay 'meet 'include 'continue 'set 'learn 'change 'lead 'understand 'watch 'follow 'stop 'create 'speak 'read 'allow 'add 'spend 'grow 'open 'walk 'win 'offer 'remember 'love 'consider 'appear 'buy 'wait 'serve 'die 'send 'expect 'build 'stay 'fall 'cut 'reach 'kill 'remain))
;;; (define adjective-list (list 'red 'slow 'dead 'pungent 'over-paid 'drunk))
(define adjective-list (list 'red 'slow 'dead 'pungent 'over-paid 'drunk 'other 'new 'good 'high 'old 'great 'big 'american 'small 'large 'national 'young 'different 'black 'long 'little 'important 'political 'bad 'white 'real 'best 'right 'social 'only 'public 'sure 'low 'early 'able 'human 'local 'late 'hard 'major 'better 'economic 'strong 'possible 'whole 'free 'military 'true 'federal 'international 'full 'special 'easy 'clear 'recent 'certain 'personal 'open 'red 'difficult 'available 'likely 'short 'single 'medical 'current 'wrong 'private 'past 'foreign 'fine 'common 'poor 'natural 'significant 'similar 'hot 'dead 'central 'happy 'serious 'ready 'simple 'left 'physical 'general 'environmental 'financial 'blue 'democratic 'dark 'various 'entire 'close 'legal 'religious 'cold 'final 'main 'green 'nice 'huge 'popular 'traditional 'cultural))
;;; (define adverb-list (list 'quickly 'slowly 'wickedly 'majestically))
(define adverb-list (list 'quickly 'slowly 'wickedly 'majestically 'up 'so 'out 'just 'now 'how 'then 'more 'also 'here 'well 'only 'very 'even 'back 'there 'down 'still 'in 'as 'to 'when 'never 'really 'most 'on 'why 'about 'over 'again 'where 'right 'off 'always 'today 'all 'far 'long 'away 'yet 'often 'ever 'however 'almost 'later 'much 'once 'least 'ago 'together 'around 'already 'enough 'both 'maybe 'actually 'probably 'home 'perhaps 'little 'else 'sometimes 'finally 'less 'better 'early 'especially 'either 'quite 'simply 'nearly 'soon 'certainly 'quickly 'no 'recently 'before 'usually 'thus 'exactly 'hard 'particularly 'pretty 'forward 'ok 'clearly 'indeed 'rather 'that 'tonight 'close 'suddenly 'best 'instead 'ahead 'fast 'alone 'eventually 'directly))

(define (sentence)
    (append (append (list 'the) (noun-phrase)) (verb-phrase))
)

(define (noun-phrase) 
    (either 
        (lambda () (list (a-noun)))
        (lambda () (append (list (an-adjective)) (noun-phrase)))
    )
) ;;; returns string
(define (verb-phrase)
    (either 
        (lambda () (list (a-verb)))
        (lambda () (append (list (a-verb)) (list (an-adverb))))
    )
) ;;; returns string

(define (pick-random lst)
    (list-ref lst (random (length lst)))
)

(define (a-verb) (pick-random verb-list))
(define (an-adverb) (pick-random adverb-list))
(define (a-noun) (pick-random noun-list))
(define (an-adjective) (pick-random adjective-list))

(define (either a b)
    (if (= (random 2) 0) (a) (b) )
)

(sentence)

;;; (define (adverb-phrase) '(pick-random adverb-list))
;;; (define (verb-phrase) '(pick-random verb-list))
;;; (define (noun-phrase) '(pick-random noun-list))
