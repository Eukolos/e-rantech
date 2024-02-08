enum AuthorityEnum {
  admin,
  accountant,
  logistic,
  seller,
  purchaser
}

class Authority {
  final AuthorityEnum authority;

  Authority({required this.authority});

  factory Authority.fromJson(String authority) {
    switch (authority) {
      case 'admin':
        return Authority(authority: AuthorityEnum.admin);
      case 'accountant':
        return Authority(authority: AuthorityEnum.accountant);
      case 'logistic':
        return Authority(authority: AuthorityEnum.logistic);
      case 'seller':
        return Authority(authority: AuthorityEnum.seller);
      case 'purchaser':
        return Authority(authority: AuthorityEnum.purchaser);
      default:
        return Authority(authority: AuthorityEnum.seller);
    }
  }

  @override
  String toString() {
    return authority.toString().split('.').last;
  }
}

class Role {
  final Authority authority;

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(authority: Authority.fromJson(json['authority'].toLowerCase()));
  }
  Role({required this.authority});

  @override
  String toString() {
    return authority.toString();
  }
}

