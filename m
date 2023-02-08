Received: from mail.wilcox-tech.com (mail.wilcox-tech.com [45.32.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490222560
	for <distributions@lists.linux.dev>; Wed,  8 Feb 2023 11:09:16 +0000 (UTC)
Received: (qmail 19466 invoked from network); 8 Feb 2023 11:02:21 -0000
Received: from unknown (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@127.0.0.1)
  by localhost with ESMTPA; 8 Feb 2023 11:02:21 -0000
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: ISO C23 removal of unprototyped functions
Date: Wed, 8 Feb 2023 05:02:05 -0600
References: <2354211.7hzS34FegO@nimes>
To: distributions@lists.linux.dev
In-Reply-To: <2354211.7hzS34FegO@nimes>
Message-Id: <199D8658-C6E9-434F-8F5D-B0D79A86080C@Wilcox-Tech.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)

On Feb 7, 2023, at 6:14 AM, Bruno Haible <bruno@clisp.org> wrote:
>=20
> Seen in the GCC change log [1]: Joseph Myers wrote:
>=20
> "
>  C2x has completely removed unprototyped functions, so that () now
>  means the same as (void) in both function declarations and
>  definitions, where previously that change had been made for
>  definitions only.  Implement this accordingly.
>=20
>  This is a change where GNU/Linux distribution builders might wish to
>  try builds with a -std=3Dgnu2x default to start early on getting old
>  code fixed that still has () declarations for functions taking
>  arguments, in advance of GCC moving to -std=3Dgnu2x as default maybe =
in
>   GCC 14 or 15; I don't know how much such code is likely to be in
>  current use.
> "
>=20
> There were two essential changes in this area in ISO C 23:
>  * https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2432.pdf
>    1) removed the K&R C syntax for function definitions
>         int foo (x, y) int x; long y; { ... }
>    2) in function definitions, () is equivalent to (void).
>  * https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2841.htm
>    3) A function declarator with a parameter list of () declares a =
prototype
>       for a function that takes no parameters (like it does in C++).
>       See ISO C 23 =C2=A7 6.7.6.3.(13).
>=20
> [1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D0a4b219d39c7=
4ae


What is the minimum version of GCC to detect this?

Is there a warning flag that could pick it up before this commit was
introduced?

Is the only released compiler that can warn on this Clang 15?[1]

Sorry if this seems silly, but we=E2=80=99re not even at GCC 12 yet in =
Ad=C3=A9lie
and I=E2=80=99d still really like to do some work on this in my spare =
time.

Best,
-A.

[1]: https://github.com/madler/zlib/issues/633#issuecomment-1419525514


--
A. Wilcox (they/them)
SW Engineering: C/C++, DevOps, POSIX
Wilcox Technologies Inc.

