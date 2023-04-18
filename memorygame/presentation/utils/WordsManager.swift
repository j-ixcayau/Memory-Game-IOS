//
//  wordList.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/04/23.
//

import Foundation

struct WordsManager {
    var WordsList = [
        "Flutter",
        "Dart",
        "Kotlin",
        "Java",
        "Jetpack Compose",
        "Swift",
        "Swift UI",
        "Objective C",
        "Node JS",
        "JS",
        "TS",
        "Angular",
        "React",
        "Python",
        "C++",
        "C#",
        "Ruby",
        "PHP",
        "HTML",
        "CSS",
        "Sass",
        "Less",
        "TypeScript",
        "CoffeeScript",
        "Vue.js",
        "Ember.js",
        "Backbone.js",
        "Knockout.js",
        "jQuery",
        "D3.js",
        "Three.js",
        "Babylon.js",
        "Express.js",
        "Ruby on Rails",
        "Django",
        "Flask",
        "ASP.NET",
        "Laravel",
        "Symfony",
        "CodeIgniter",
        "Yii",
        "Spring Framework",
        "Hibernate",
        "Apache Struts",
        "Apache Maven",
        "Gradle",
        "Jenkins",
        "Git",
        "SVN",
        "Docker",
        "Kubernetes",
        "Amazon Web Services (AWS)",
        "Microsoft Azure",
        "Google Cloud Platform (GCP)",
        "Firebase",
        "MongoDB",
        "MySQL",
        "PostgreSQL",
        "Oracle",
        "Microsoft SQL Server",
        "Redis",
        "Memcached",
        "Apache Kafka",
        "RabbitMQ",
        "Elasticsearch",
        "Logstash",
        "Kibana",
        "Grafana",
        "Prometheus",
        "Nagios",
        "Zabbix",
        "Splunk",
        "Graylog",
        "Apache Spark",
        "Apache Hadoop",
        "Apache Cassandra",
        "Apache ZooKeeper",
        "Apache Flink",
        "Apache Beam",
        "TensorFlow",
        "Keras",
        "PyTorch",
        "OpenCV",
        "Unity",
        "Unreal Engine",
        "Blender",
        "Adobe Photoshop",
        "Adobe Illustrator",
        "Sketch",
        "Figma",
        "InVision",
        "Zeplin",
        "Trello",
        "Jira",
        "Asana",
        "Basecamp",
        "Slack",
        "Zoom"
    ];
    
    
    func getListShuffled(dificultyLevel: DifficultyLevel) -> [GuessWord] {
        var wordsList: [GuessWord] = []
        
        let wordsChossen = getRandomWords(dificultyLevel: dificultyLevel)
        
        
        for word in wordsChossen {
            wordsList.append(GuessWord(word: word))
            wordsList.append(GuessWord(word: word))
        }
        
        wordsList.shuffle()
        
        return wordsList
    }
    
    func getRandomWords(dificultyLevel: DifficultyLevel) -> [String] {
        let listSize = getListSizeFromDifficulty(dificultyLevel: dificultyLevel)
        var wordsChoosen: [String] = []
        
        while (wordsChoosen.count != listSize){
            let randomWord = WordsList.randomElement()
            
            if randomWord != nil && !wordsChoosen.contains(randomWord!) {
                wordsChoosen.append(randomWord!)
            }
        }
        
        return wordsChoosen
    }
    
    
    func getListSizeFromDifficulty(dificultyLevel: DifficultyLevel) -> Int {
        switch dificultyLevel {
        case .Easy:
            return 3
        case .Medium:
            return 6
        case .Hard:
            return 9
        }
    }
    
}
