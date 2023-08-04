Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA91DA2B
	for <asahi@lists.linux.dev>; Fri,  4 Aug 2023 20:48:06 +0000 (UTC)
Date: Fri, 04 Aug 2023 20:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1691182083; x=1691441283;
	bh=dVK5thJG/d4WivXGlKQOT3yBXYSFaIU8V67BLTyAtb8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WrMiBN4JgBzYbnlldhzOUEst9xyxM54o6kIsL1GtXaGkqVm5cEocmJBXdDtKRn8Lg
	 Qzk8ONS+yURsMPyghqTePuido4SQW5ifAs+lm5eYtZqKTXIjoJaIX3V9Z7S6VTX/nK
	 3gDloL6sB0nIYCpymefriFIGgeqnxnml3lm5lKZ9qH6dMAxf/MjxPLW3ic/3tEcEdE
	 qYIPTs40hsOfP9xltxgCg871XujGp+gERqh8CkKKvjp8ZwSUI0rW6TMqdCFcuo1lMe
	 XnXPbrgmT908dfTcUE/FAfxThrjErBKp+2wHaR7fWkPsUgDeRIicXfWbg07lzKEBDu
	 /ytbabGE0JqpQ==
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>
From: a20line <a20line@proton.me>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "marcan@marcan.st" <marcan@marcan.st>, "sven@svenpeter.dev" <sven@svenpeter.dev>, "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>
Subject: Discrepancies in Asahi Linux patch submissions
Message-ID: <T3ZEuG8R3BUdqIoCdT3Yp_hQSvz4M0zTtZR3teIKQaaxI3VCxOm6QXDzq-Ub46rkpT-v688CZNmBwnjFP2x5LWhMeWUr-rjOdTKrL_L7k50=@proton.me>
Feedback-ID: 82752623:user:proton
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

An investigation has uncovered that many Linux patches regarding the Linux =
on Apple Silicon project, otherwise known as "Asahi Linux", are being submi=
tted under false pretenses.

Specifically, the person that calls themselves "Asahi Lina" is actually Hec=
tor Marcan. There is no such person as "Asahi Lina", and Kernel policy spec=
ifically prohibits the submission of patches under fake names or anonymous =
aliases. The developer code of origin states that real names must be used a=
nd that "pseudonyms or anonymous contributions" are not allowed.

How do we know that Asahi Lina is Hector?

This screencap was taken from one of Asahi Lina's streams: https://files.ca=
tbox.moe/bcmnmr.png. You can clearly see that he breaks character for a mom=
ent when he tries to switch his home directory from his "Asahi" persona to =
his real world identity as Hector Marcan.

He has also done streams were he seamlessly transitions from his "Hector" i=
dentity to his "Asahi Lina" identity, like this one: https://www.youtube.co=
m/watch?v=3DeffHrj0qmwk (archived: https://ghostarchive.org/varchive/effHrj=
0qmwk).

Asahi Lina has also made statements such as: "If you want to support my wor=
k, you can donate to marcan=E2=80=99s Asahi Linux support fund on GitHub Sp=
onsors or Patreon, which helps me out too!"
This is only some of the evidence that corroborates to Hector Marcan being =
Asahi Lina.

Each piece of evidence, on their own, might not mean much. But put together=
 it puts a compelling argument that Asahi Lina *is* Hector Marcan. There ar=
e countless patches that have been submitted under these false pretenses, s=
uch as https://lore.kernel.org/asahi/5780e4c4-b0a0-382f-d659-9c4722a3582c@a=
sahilina.net/ . To ensure fairness in Kernel submission processes, Hector s=
hould retire the use of the "Asahi Lina" character when it regards to the s=
ubmission of patches to the Linux Kernel.
