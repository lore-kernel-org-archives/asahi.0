Received: from 18.mo550.mail-out.ovh.net (18.mo550.mail-out.ovh.net [46.105.35.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF52F4A15
	for <asahi@lists.linux.dev>; Thu, 15 Feb 2024 04:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.35.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707972594; cv=none; b=HHzW4yQi5gc9SRNT2LE3wU90Psf0Zx0d7QUEPeAZioUPcGjyqtoqpC1VUGKFHR1MaOhTdguvqTvWe7uP/w5HruVMhMT9FbXv5lfE1KANzhCPunesj6AWX7cjvbSaFoVuGkRbV601muy42M4MfGtleZUA+bMsizVY76bd9WKiCUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707972594; c=relaxed/simple;
	bh=Zn2YmXTGnlmFWVJAWE0ZcsbcTLkjNnzhl3e0UcTBfKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HtwFwq5eqC/8Dx3w3e8jKXqhfZOJZrj7TiO1Acg4j+QAKR3TU7wX66cq5YYixdrkqDLH9zy3dDfLsMjEQD/aiwsd7yggs3mekxq9Oaf6xK/3VWBt7oq1Hx52Y488S5uU2ZVb9KS2S7sl2tSQuRO/b67My4NOooyZvGPbEeWe2SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.35.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.89])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4TZs9H0DFbz1GJS
	for <asahi@lists.linux.dev>; Wed, 14 Feb 2024 21:42:10 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-62rx8 (unknown [10.108.54.171])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 58D4F1FD57;
	Wed, 14 Feb 2024 21:42:04 +0000 (UTC)
Received: from etezian.org ([37.59.142.103])
	by ghost-submission-6684bf9d7b-62rx8 with ESMTPSA
	id pzx8A6wzzWWJKwIAfHX53g
	(envelope-from <andi@etezian.org>); Wed, 14 Feb 2024 21:42:04 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-103G00581a402d0-df4d-43c0-80f3-f5461175c724,
                    C0FC2E5C6A7315DD97BDDE4B9606AB6EEADB6D9F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Wolfram Sang <wsa@kernel.org>, 
 Olof Johansson <olof@lixom.net>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240212111933.963985-1-arnd@kernel.org>
References: <20240212111933.963985-1-arnd@kernel.org>
Subject: Re: [PATCH] i2c: pasemi: split driver into two separate modules
Message-Id: <170794692308.4040459.7350373390928340229.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 22:42:03 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 3725039842831960594
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejgdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

Hi

On Mon, 12 Feb 2024 12:19:04 +0100, Arnd Bergmann wrote:
> On powerpc, it is possible to compile test both the new apple (arm) and
> old pasemi (powerpc) drivers for the i2c hardware at the same time,
> which leads to a warning about linking the same object file twice:
> 
> scripts/Makefile.build:244: drivers/i2c/busses/Makefile: i2c-pasemi-core.o is added to multiple modules: i2c-apple i2c-pasemi
> 
> Rework the driver to have an explicit helper module, letting Kbuild
> take care of whether this should be built-in or a loadable driver.
> 
> [...]

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: pasemi: split driver into two separate modules
      commit: 3fab8a74c71a4ba32b2fa1dca7340f9107ff8dfc

