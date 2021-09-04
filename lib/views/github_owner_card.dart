import 'package:evision_github_repos/models/github_owner.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////
/// 1. Split main widget to smaller widget to avoid rebuilding in the future
/// 2. Check for nullable variables and fields
/// 3. UI for the card
/// ----------------------------------------------------
/// | Photo | Information
/// ----------------------------------------------------

class GithubOwnerCard extends StatelessWidget {
  final GithubOwner githubOwner;

  const GithubOwnerCard({Key? key, required this.githubOwner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10,bottom:10),
      decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1.5)
            ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // User Avatar
          GithubOwnerAvater(
            avatarUrl: githubOwner.avatarUrl,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // User's Name
            GithubOwnerName(
              displayName: githubOwner.displayName,
              loginName: githubOwner.loginName,
            ),
            // User's bio
            GithubOwnerBio(bio: githubOwner.bio),
            // User's company
            GithubOwnerCompany(
              company: githubOwner.company,
            ),
            // User's Location
            GithubOwnerLocation(
              location: githubOwner.location,
            ),
            // User's following users and followers
            GithubOwnerFollowingsFollowers(
              followers: githubOwner.followers,
              followings: githubOwner.following,
            )
          ])
        ],
      ),
    );
  }
}

class GithubOwnerAvater extends StatelessWidget {
  final String? avatarUrl;

  const GithubOwnerAvater({Key? key, this.avatarUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (avatarUrl == null) {
      return CircleAvatar(
        child: Icon(Icons.person),
      );
    } else {
      return CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(avatarUrl!),
      );
    }
  }
}

class GithubOwnerName extends StatelessWidget {
  final String? loginName, displayName;

  const GithubOwnerName({Key? key, this.loginName, this.displayName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      displayName == null ? loginName! : displayName!,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class GithubOwnerBio extends StatelessWidget {
  final String? bio;

  const GithubOwnerBio({Key? key, this.bio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(bio == null ? 'No biography provided!' : bio!);
  }
}

class GithubOwnerCompany extends StatelessWidget {
  final String? company;

  const GithubOwnerCompany({Key? key, this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.location_city,
        color: company == null ? Colors.grey : Colors.black,
      ),
      Text(
        company == null ? 'No company provided!' : company!,
        style: TextStyle(color: company == null ? Colors.grey : Colors.black),
      )
    ]);
  }
}

class GithubOwnerLocation extends StatelessWidget {
  final String? location;

  const GithubOwnerLocation({Key? key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.location_on,
        color: location == null ? Colors.grey : Colors.black,
      ),
      Text(
        location == null ? 'No location provided!' : location!,
        style: TextStyle(color: location == null ? Colors.grey : Colors.black),
      )
    ]);
  }
}

class GithubOwnerFollowingsFollowers extends StatelessWidget {
  final int? followings;
  final int? followers;

  const GithubOwnerFollowingsFollowers(
      {Key? key, this.followings, this.followers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        'Followings: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(followings == null ? '0' : followings.toString()),
      Text(
        ' Followers: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(followers == null ? '0' : followers.toString())
    ]);
  }
}
