(ns primes-part-1.core
  (:gen-class))


(defn sqrt
  "Returns the sqrt of `n`. This is just a wrapper for Java's `Math.sqrt`."
  [n]
  (Math/sqrt n))


(defn divisible?
  "Returns `true` if `num` is divisible by `div`, and `false` otherwise."
  [num div]
  (zero? (mod num div)))


(defn candidate-divisors
  "Returns a list of possible divisors of `n`.

  The current implementation is slightly better than the naïve implementation,
  which returns all numbers between 1 and `n`. This removes a number of
  possibilities by ending at the sqrt of `n`."
  [n]
  (let [largest-candidate (-> n sqrt int)]
    ;; return the numbers `[2, 3, ..., largest-candidate]`
    ;; `largest-candidate` is incremented because range does not include the
    ;; end limit
    (range 2 (inc largest-candidate))))


(defn prime?
  "Returns `true` if `n` is prime, and `false` otherwise."
  [n]
  (not (some (partial divisible? n)
             (candidate-divisors n))))


(def primes
  "A lazy-seq containing all prime numbers, until Integer/MAX_VALUE."
  (filter prime? (range 2 Integer/MAX_VALUE)))


(defn prime-range
  "Returns the prime numbers between `start` and `end`."
  [start end]
  (->> primes
       (drop-while #(> start %))
       (take-while #(<= % end))))


(defn -main
  "Main program logic."
  [& args]
  (doseq [p (prime-range 1 100)]
    (println p)))
