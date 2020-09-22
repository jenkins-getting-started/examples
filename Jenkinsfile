#!/usr/bin/env groovy 

// EXAMPLE FROM:
// https://www.jenkins.io/doc/pipeline/examples/#trigger-job-on-all-nodes

// Wes comments: I love this example because it makes clear the distinction betwee "phases" of execution where you have at least:
  // 1. Build requests for pipeline models desired to be run
    // Pipelines have a script of sorts that creates the pipeline model either `imperatively` or `declaratively`
    // This script is `dynamic` in queryig all nodes to build a pipeline model to run on all nodes! So, 
      // 5 nodes -> 5 runs
      // 2 nodes -> 2 runs
  // 2. Execution of each pipeline model in parallel 
    // This script then invokes the model to run the pipelies!
  // And we could have N levels of work because I could Schedule other Schedulers that then trigger Runs and then you have to ask is there really a differnece between any layer? No. Not beyond `node` and `workspace` allocation 

// The code will require approval of several Jenkins classes in the Script Security mode
  // or with caution disable sandboxing on the pipeline... useful especially with jenkinsfile-runner! 

def branches = [:]
def names = nodeNames()
println(names)
for (int i=0; i<names.size(); ++i) {
  def targetNodeName = names[i];
  dumpMe()
  branches["node_" + targetNodeName] = {
    
    dumpMe()

    node(targetNodeName) {

      dumpMe()
      echo "hi ${i}"

    }
  }
}

def dumpMe() {
  echo "NODE_NAME: ${env.NODE_NAME}"
}

// I wonder how much fun we could have with this.. could I pass the invocation here off to another node? can you do that without allocating a workspace? Can you "shell out" to other flyweights?
// Now we trigger all branches
parallel branches

// This method collects a list of Node names from the current Jenkins instance
@NonCPS
def nodeNames() {
  // FYI instance.nodes excludes the master
  // https://javadoc.jenkins-ci.org/jenkins/model/Jenkins.html#getNodes--s
  return (jenkins.model.Jenkins.instance
            .nodes
            .collect { node -> node.name } << "master")
            // FYI I append "master" hardcoded for not just running on agents, that may cause issues if master is changed as a term here or if I should go off of a label for the current node instead. 
}
