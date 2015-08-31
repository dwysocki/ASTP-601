(defproject primes-part-1 "1.0.0"
  :description ""
  :url ""
  :license {:name "MIT License"
            :url "http://opensource.org/licenses/MIT"}
  :dependencies [[org.clojure/clojure "1.6.0"]]
  :main ^:skip-aot primes-part-1.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all
                       :uberjar-name "primes-part-1.jar"}})
