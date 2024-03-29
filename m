Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139656B67
	for <distributions@lists.linux.dev>; Fri, 29 Mar 2024 23:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711754479; cv=pass; b=enCrqG21zo6Mxm6KYrZc4N9ASo5mihsPWBXO/8WL85CF82upm/H6KgqkHI2G8JHJxoPbHr1EXWni5AKSTSY6T34yDToAcoNgLe+6v4lHZrt+R4xTpZsc4Os+dMu0r7dY/A7kU5FllHNbYjBfrY/grgLiN5Y5rhUXFHWr5v9tCDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711754479; c=relaxed/simple;
	bh=eS9AqkiPf9qmJc1NTSCwDiDuGIdOvBkI8kbPOJFphnU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KcfM+BepZ8XGUnCq2yYr8xdpnOLCgOKi3VwYpM+oZsb7tSEUKTshYgn2gyaWQelbU4vT8Fi5eSh/80z3fUB4yXAP2y/YAgoZRobu3DBJHW/hsqUDVRUExB96s0TCNjeZLisHZ5NDNZNsK676t4ZvOvoS3mYc4wGbjlpvmq4OEao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=tv6uLhKj; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=NYwOxodY; arc=pass smtp.client-ip=81.169.146.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="tv6uLhKj";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="NYwOxodY"
ARC-Seal: i=1; a=rsa-sha256; t=1711753034; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ovf8InJpoN1mp+JNtekmcZq/UmavsMiZxo8TeYmPhVPjDXXk+wxKcRNSV67cx+cYM2
    hML4pO1XDcF8dHiEHoaB7iRSIFi76oBRE57/hEHm8dclNKImFVbhCoxUGaKAxUqHDj6K
    kFWB2lqxrIqtmJKvGhOXjGj9fPdE/9HN7vw23MDHXD2OsdxE9oQ0OBvWblxmswG1hUPx
    iX2m5pBtuRf1s9XgTMyyjDZYcIGRwQj1PqwsvTRZTzYL0CdDGwt5EMtLJDzSsO/bwUZ2
    Him+kmuppQ5rxvowtMwVLdMOBdrupHBVsu1EHlzZMsuEwffqYncZEgHbd16LDJdKG6L5
    QbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1711753034;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=eS9AqkiPf9qmJc1NTSCwDiDuGIdOvBkI8kbPOJFphnU=;
    b=ke0dm2Iz5RCQDQpU2uU8LOR3vQT9ePMOYNd2ef3ULeH6oZzgEV+rt5Lu3UQ8QE4y6P
    V/6BJn3MQAmR0m5/o/VsdpTGvtpt0eXGmIAXAMrkWJRgdrSZjG8fJCaRgVzyUNDLPS9j
    O+HSd/pRk6c2CyyzazpJMbF3/XT4uvISVkC+cS8ebctv6sgz5gG0SCPc1W2zKMKjDHPp
    YaU4T56hSDGZ431gkiWHOPdPLabc2BAV9Bmd0zSVmPSP11q+FliNllr4J20JpnaMXHhs
    GaaJFU1epPs3plsorBalO0mKEyb1xgysKA9bB261pJak0fIaSv/z1l42bfOU75IucsT3
    BL7g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1711753034;
    s=strato-dkim-0002; d=clisp.org;
    h=Message-ID:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=eS9AqkiPf9qmJc1NTSCwDiDuGIdOvBkI8kbPOJFphnU=;
    b=tv6uLhKjMrytYVSLJDahY0XKJ8RSl6LfnmNC3zgoOllwn6R+5Lubpnzh9JMuYd9Ick
    zzEazbBV+dctLOiYAvamRqSKFTaH+C2FbrSRBptmsRoppRY1SJ/56+KG2SfvURM0kfl/
    WkbiS+isdE0WbuR3uLZP98smMb+sHkm/lqxcDYU5c4AFNF3Zcx0Qpk15r3tJTisYsgwR
    z80JyuWZ34RrcWZ9w8SS7aUDkTDJXPetkzcdu6b2K+e2Q8D6KLrN97lbmFqdNcqsoq2r
    m4TCnrWRslbvHoY0VjEcoAc8UUl83ZvhXK//ySd6k/1jTe+breBMIx5Gt0qRMT5/2kJz
    CRrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1711753034;
    s=strato-dkim-0003; d=clisp.org;
    h=Message-ID:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=eS9AqkiPf9qmJc1NTSCwDiDuGIdOvBkI8kbPOJFphnU=;
    b=NYwOxodY3Es7hrsyrn4FCB+0Y/UHoPQi7jzFv2RXF+iGbqTtg+Fan6tcJvmUJz8H7S
    iYzuB5T2i7yv9kNzASBA==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOX36CD0NTWsDt9wtHeWYpx+S7ULw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 50.3.2 AUTH)
    with ESMTPSA id N8610002TMvDhM2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 29 Mar 2024 23:57:13 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev
Subject: the upstream xz package has been backdoored
Date: Fri, 29 Mar 2024 23:57:13 +0100
Message-ID: <15400809.HqYbtU4b6p@nimes>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

https://www.openwall.com/lists/oss-security/2024/03/29/4
https://security.archlinux.org/ASA-202403-1



