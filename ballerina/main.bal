import ballerina/lang.runtime;
import ballerina/io;

public function main(int numStrands = 100000) returns error? {
    future[] futures = [];
    foreach var i in 0 ..< numStrands {
        futures[i] = start runtime:sleep(seconds = 10);
    }

    foreach var f in futures {
        _ = check wait f;
    }

    io:println("All strands complete");
}
