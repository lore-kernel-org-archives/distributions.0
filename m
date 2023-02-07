Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF32563
	for <distributions@lists.linux.dev>; Tue,  7 Feb 2023 12:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1675772086; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qNIg64lhjNkuTbH5o6eIuBBlLf08Gcj4tQschfSVkSvTemcZq4cVrLxaHk+rED/mHh
    NxxNSxG0Qs/e8uVohYM4U1KTVBY3317HErMVOHbUjmAIh9iHUcB+nFf2zwGSAJWdemLa
    JheAqCaPVRJUR/YBPWVbWytsuuuk1E//dG8GM3EI9HkS/1QStEoda96nP+d/UYCuanVZ
    cBOShtOdVDvOSWdVUw+c5bAb3YkrB1NMWB4VueRGxDwvo2JdIiszosmSAy0Cjmia3cso
    rZFOAGF8boE7oDmICcK+kz5Tfc9r8WwL4ebeHeaq35kwGBD41kdwIWfLuBLRv5K6Fe8J
    80rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1675772086;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=l7OtvWN4kJI1NZ3vTDs9yYicm5AdKWvXHnDtZnadagc=;
    b=Utv8PBoi4jMVdIKVSMPxsM4jXXPBlgcqN7cZ+a1hhrwrxpQxzdJ0FEKLn8zW5G3b0J
    D+AYYspGrMNZJ6NDHObTXaYBfzxrrb//49KjFGWTN+8797ruAqk+IGTfvYf1LAYRFeAN
    vDVvQgY07ypdfL8EBQwRBsG9RfkOBQWYRz8MWpiLNnqxLERww87sZWXe4xy8SXMKUVpr
    BjDMMUQt8QPB7Q96YhQKk3IbxN36hVzld+/U0DsbJ//AypnyMFFUgJWpEBddWi5eyvw/
    e3Se8zlK++A21WvQcmUoobiuiCDhjn6BH9wvGHL/iK36bIExHE6yx/96N877ncAUAXkZ
    CNFg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1675772086;
    s=strato-dkim-0002; d=clisp.org;
    h=Message-ID:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=l7OtvWN4kJI1NZ3vTDs9yYicm5AdKWvXHnDtZnadagc=;
    b=ZqYcxqdLepmNh8Q97YvptErh/4sOW57aNquHdNnnxFH6tviukZ8MXW6SfUoAOyOfeV
    VkfDNZjzExBGspFB4JJyZSEXgVby2i+OHu+zM0V66q61IR1WJUJKtOw2vkeXRDn0T1Wa
    NE1h5xHWKzXgYgoBdExYnZuXNSFJ/u9wT9G8eqSAc1F2oupyStQbVap4qbARFU4gP8pc
    bvsEJKbAniaSs7AcScc1WL/ijG7AakQefNhK7+rjwU57bhUwnXw8y8yT+IfcIM1kqy5j
    oKyc/YDmn1zxdGDVhQvJ1GjiApLEZ3A1+tyokvxO7DhUoG/vqIi57E/X+zHT9ANc9S/7
    Aqww==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPC1KfYkleKWTRodtbeYDhUUfKFSw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.3.0 AUTH)
    with ESMTPSA id f83259z17CEk14r
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 7 Feb 2023 13:14:46 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev
Subject: ISO C23 removal of unprototyped functions
Date: Tue, 07 Feb 2023 13:14:46 +0100
Message-ID: <2354211.7hzS34FegO@nimes>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Seen in the GCC change log [1]: Joseph Myers wrote:

"
  C2x has completely removed unprototyped functions, so that () now
  means the same as (void) in both function declarations and
  definitions, where previously that change had been made for
  definitions only.  Implement this accordingly.

  This is a change where GNU/Linux distribution builders might wish to
  try builds with a -std=3Dgnu2x default to start early on getting old
  code fixed that still has () declarations for functions taking
  arguments, in advance of GCC moving to -std=3Dgnu2x as default maybe in
   GCC 14 or 15; I don't know how much such code is likely to be in
  current use.
"

There were two essential changes in this area in ISO C 23:
  * https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2432.pdf
    1) removed the K&R C syntax for function definitions
         int foo (x, y) int x; long y; { ... }
    2) in function definitions, () is equivalent to (void).
  * https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2841.htm
    3) A function declarator with a parameter list of () declares a prototy=
pe
       for a function that takes no parameters (like it does in C++).
       See ISO C 23 =A7 6.7.6.3.(13).

[1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D0a4b219d39c74ae



