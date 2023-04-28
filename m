Received: from out-19.mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9647320C
	for <distributions@lists.linux.dev>; Fri, 28 Apr 2023 21:20:04 +0000 (UTC)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ayaya.dev; s=key1;
	t=1682716802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ctClMPAaTlwWlqdtSn39jbZLb9cUlTos/E0O/mBdQws=;
	b=FXIh6BxA6kmJod5YPOaaU9RodLguseXVnYgRLmj4oH4S3XYGFKhncoBt/NcQZiXIHzWq2W
	5tr6vTL/hvscoqw3d50xfmERIDPfwk95ZafHm/9HaJaFh4JydqMRGAS8Si+cwKDTXGoMY2
	f6u65ABfCJT9XGLiGmduO7RNvqFTu9w=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Apr 2023 23:20:01 +0200
Subject: libxml 2.11.0 breaks ABI by default
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "alice" <alice@ayaya.dev>
To: <distributions@lists.linux.dev>
Message-Id: <CS8PATFTJR44.11UWSSD7U7RUF@sumire>
X-Migadu-Flow: FLOW_OUT

upstream report: https://gitlab.gnome.org/GNOME/libxml2/-/issues/526

this might be a similar issue as:
https://gitlab.gnome.org/GNOME/libxml2/-/issues/433

the likely cause, however, is symbol visibility. from the changelog:

 This release finally fixes symbol visibility on UNIX systems. Internal sym=
bols
 will now be hidden. While these symbols were never declared in public  hea=
ders,
 it was still possible to declare them manually. Now this won't work.

 All symbol information has been removed from the ELF version script to fix
 link errors with --no-undefined-version. The version nodes are kept so it
 should still be possible to run binaries linked against older versions.

distributors should most likely rebuild everything against this version,
or find a way to toggle to the old version, to ensure ABI compatibility.
