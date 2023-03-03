Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7A1FDD
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 10:46:49 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 6A1B222AFD
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677840407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1ZTTitl2uxUpWv6RPH/ToCbvYO6t29x21/8DpF2GyTk=;
	b=l5rwJ62AL0NGH6wC+1lqpohFTD24Z1o+QyUSe8XFVVhoL39OWbAmKzfJEbchd6GosBdDtD
	4njkY2s3k8ni1R46lWxqfHpavcBw/EE7AJ6/A3iOpE1VKyMHZib+NeBMUHL4vl8xXdT39K
	futIi3j7pu1X+CCo3ZNjhZBuPx18YQk=
Received: from kukuk-phex.future.suse.de (unknown [10.162.233.67])
	by relay2.suse.de (Postfix) with ESMTP id 60D5A2C141
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 10:46:47 +0000 (UTC)
Received: by kukuk-phex.future.suse.de (Postfix, from userid 358)
	id 4F0036488B; Fri,  3 Mar 2023 11:46:47 +0100 (CET)
Date: Fri, 3 Mar 2023 11:46:47 +0100
From: Thorsten Kukuk <kukuk@suse.com>
To: distributions@lists.linux.dev
Subject: Y2038, glibc and utmp/utmpx on 64bit architectures
Message-ID: <20230303104647.GA20891@suse.com>
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

I hope everybody is aware of the Y2038 problem. And not only for 32bit
architectures, but also 64bit architectures are not ready today, at
least not if they use glibc.
glibc uses for compatibility with 32bit userland applications 32bit
values for time_t and other variables even on 64bit systems.
Affected is everything around utmp/utmpx, wtmp/wtmpx and lastlog.

I wrote a blog about how to solve that for utmp/utmpx by using the data
from systemd-logind instead:
https://www.thkukuk.de/blog/Y2038_glibc_utmp_64bit/

A detailed analysis also for wtmp and lastlog, which have the same
problems, can be found here:
https://github.com/thkukuk/utmpx/blob/main/Y2038.md


   Thorsten

-- 
Thorsten Kukuk, Distinguished Engineer, Senior Architect, Future Technologies
SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nuernberg, Germany
Managing Director: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
