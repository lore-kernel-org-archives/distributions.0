Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80849460
	for <distributions@lists.linux.dev>; Tue, 21 Mar 2023 13:53:01 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 19D9221B4F
	for <distributions@lists.linux.dev>; Tue, 21 Mar 2023 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679406780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/5CHmf6Lk96ncUNdfsqm+3Hiaq/GJ6dyUka69HbQT8A=;
	b=azrcWWYnplh4OZRd09p1RQqsag+2wGa46wfjOgqP2enVRic6RhZhn2dT6iZ6+zwTY3wus7
	pjKLfOdj8K8VXWjjcC8uFHsiCa//flnzAcHw/HDnc6qhlmh0FMuh7wL7bbO5xHhcHf2iYV
	eIkTXso3w+ZWaLuxwHfspWh4RQlBz7A=
Received: from wotan.suse.de (wotan.suse.de [10.160.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0E90A2C141
	for <distributions@lists.linux.dev>; Tue, 21 Mar 2023 13:53:00 +0000 (UTC)
Received: by wotan.suse.de (Postfix, from userid 358)
	id 024F263BB; Tue, 21 Mar 2023 13:53:00 +0000 (UTC)
Date: Tue, 21 Mar 2023 13:52:59 +0000
From: Thorsten Kukuk <kukuk@suse.com>
To: distributions@lists.linux.dev
Subject: lastlog2 as Y2038 safe lastlog replacement
Message-ID: <20230321135259.GA32352@suse.com>
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

I wrote now "lastlog2" as Y2038 safe lastlog replacement.

All the informations can be found in my blog: https://www.thkukuk.de/blog/Y2038_glibc_lastlog_64bit/
and the code on github: https://github.com/thkukuk/lastlog2

In short: lastlog2 consist of a library, which provides a generic API
for this, a PAM module, so that no application needs to be touched, and
a lastlog2 application similar to 'lastlog' to display and maintain the
data.
sqlite3 is used as backend, a robust, well maintained database.

   Thorsten

-- 
Thorsten Kukuk, Distinguished Engineer, Senior Architect, Future Technologies
SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nuernberg, Germany
Managing Director: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
