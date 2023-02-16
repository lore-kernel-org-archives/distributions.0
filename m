Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86D17FF
	for <distributions@lists.linux.dev>; Thu, 16 Feb 2023 07:06:35 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 0241E24004B
	for <distributions@lists.linux.dev>; Thu, 16 Feb 2023 08:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1676531187; bh=+d2rktBkZ5RnB4DM5rgQ5Qfoap4Tf7FpD6bmhx1GQVA=;
	h=From:To:Cc:Subject:Date:From;
	b=qiOf2ghGcXs3yMWnHxYBUFyei/c9GrR/gjSXgr5BUs4XVwDzwAppVrdv+fLs84dRH
	 OmJUcQX0duGFQjJeOmF/5IX5tlxc8kOt/K/WpA40ITLusCHK95p/7KnjoYxFGRvx8I
	 OdzdAaBPtWKFmtNOrUi+MLsrGR2eNXh8R96iSbo/xLP/8kGf2vzjJftEjyZS7v4/5C
	 kGphUy0gvjzVV4POvB0m/6Qdacqlhx5ipExxdj4bCee79RkzSqDiLabyrTPFOHuAUd
	 WRQCsXgHOKM6QN4d4vH8E/pmNAnQQUfizzoW3PXQiBN1ZHPBhqNdFx/YBd1YmLHaJU
	 SckRZbqig5rtw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4PHQwK69kNz6tn4;
	Thu, 16 Feb 2023 08:06:25 +0100 (CET)
From: Dan =?utf-8?B?xIxlcm3DoWs=?= <dan.cermak@posteo.net>
To: Guillem Jover <guillem@debian.org>
Cc: distributions@lists.freedesktop.org,  distributions@lists.linux.dev
Subject: Re: Distributions coordination lists
In-Reply-To: <Y+2JYG5pYyyG1CG0@thunder.hadrons.org>
References: <Y+2JYG5pYyyG1CG0@thunder.hadrons.org>
Date: Thu, 16 Feb 2023 07:06:25 +0000
Message-ID: <87v8k22ioe.fsf@cgc-instruments.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Guillem Jover <guillem@debian.org> writes:

> Hi!
>
> I just noticed this new distributions coordination list:
>
>   https://subspace.kernel.org/lists.linux.dev.html
>
> Which seems to have already close to 80 participants. Although there
> was already a list that seems had the exact same purpose at:
>
>   https://lists.freedesktop.org/mailman/listinfo/distributions
>
> With around 280 participants. I think it would be nice to avoid
> fragmentation for this kind of coordination efforts?

My guess is that most people forgot about it, as the list on
freedesktop.org had not much activity in nearly a decade...


Cheers,

Dan
