(fn t4 [string] (apply str (interpose "," (filter #(#{"1", "4", "9", "16", "25", "36"} %1) (clojure.string/split string #",")))))