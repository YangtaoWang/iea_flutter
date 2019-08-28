class PolicyInfo {
    String content;

    PolicyInfo({
        this.content,
    });

    factory PolicyInfo.fromJson(Map<String, dynamic> json) => new PolicyInfo(
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
    };
}