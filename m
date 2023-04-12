Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68145660
	for <distributions@lists.linux.dev>; Wed, 12 Apr 2023 13:45:28 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id C8A971F890
	for <distributions@lists.linux.dev>; Wed, 12 Apr 2023 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1681307126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AUu4aHQoKYboWrRZe6NeFXDryQvBZOQDthdXqrEiEzs=;
	b=fE78KhriiLx5RHv76uqXdPtieH9HAD/Q311C6k2CR/fWZzgEd/ci19y0VYml7ww5KBTV/X
	GogCbtN1hCnVqyGncSkOqZg+l45U80lKKuweDhPHgSqQinY9hiX+qBYi0S8J+YJqgaIiVD
	4AkuYwOYXtJbA6WXnQzKn3chcYmsXzI=
Received: from wotan.suse.de (wotan.suse.de [10.160.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id BFACC2C143
	for <distributions@lists.linux.dev>; Wed, 12 Apr 2023 13:45:26 +0000 (UTC)
Received: by wotan.suse.de (Postfix, from userid 358)
	id 97ACF646B; Wed, 12 Apr 2023 13:45:26 +0000 (UTC)
Date: Wed, 12 Apr 2023 13:45:26 +0000
From: Thorsten Kukuk <kukuk@suse.com>
To: distributions@lists.linux.dev
Subject: wtmpdb as Y2038 safe wtmp replacement
Message-ID: <20230412134526.GA11939@suse.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)


Hi,

as already written, there are several Y2038 problems with glibc even on
some 64bit architectures
(https://www.thkukuk.de/blog/Y2038_glibc_utmp_64bit/).

There is now also an alternative to wtmp:
https://github.com/thkukuk/wtmpdb
https://www.thkukuk.de/blog/Y2038_glibc_wtmp_64bit/

In short, wtmpdb consist of a library, which provides a generic API
to store login and logout times of an user. In contrast to wtmp, the
logout time will not get an own entry, but the logout time is added to
the existing login entry.
Additional, there is a tool "wtmpdb" to replace "last" ("wtmpdb last"
tries to be compatible with "last" for the most options), which is also
able to create the boot and shutdown entries.

pam_wtmpdb collects the login and logout times, so there is no need
anymore for applications to bother about creating correct wtmp entries.
Since there is no standard or something similar for this, currently it's
a mess what applications are doing: some write up to three wtmp entries
for the same user at login time, others use the generic /dev/console as TTY. 
This leads to the problem that last, who combines login/logout entries
by comparing the user and TTY, is no longer able to correctly match the
login and logout records and prints out wrong informations.

If an application does not know the TTY during authentication (like
openssh), there is still libwtmpdb to create the entries.

  Thorsten

-- 
Thorsten Kukuk, Distinguished Engineer, Senior Architect, Future Technologies
SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nuernberg, Germany
Managing Director: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
