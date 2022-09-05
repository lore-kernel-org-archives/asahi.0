Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1B3C02
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 16:59:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 294655C00E9;
	Mon,  5 Sep 2022 12:59:02 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Mon, 05 Sep 2022 12:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1662397142; x=1662483542; bh=Sh
	h3LMvh5cLwa5Wm2j+dYZlXgI/hHnKoVcHSaX3pFYo=; b=xGV1Vmi9pUwMbp6fa4
	uQtwJZHUOriAh7V49KZ/lCM6BuOQ+nbCM5Ji7tZLs/lthBy6VWc1CJ1zKkc3D1La
	VjKzqN1BmQOQq0Cqhh/PNxHA1ttPNB5OTYsIGgRxbChaT/TogwSBExrdBFmdmRLG
	FR9i8Y5S2OwEcJRsbqJCJclG4q/p2O43Ls2Mdk2lNuadQI6qBWhZAuoXbiyaISkl
	tkQwpbSAw6m9nJErXBbKlT6/gcJdVm/9sY8rK0n6pRiiXolDJG/MQuvlT6q4mEHF
	SMosHeGp8LSpje1cLYxgtU87UqSq0CFAC7YddGBYsYibnuBL/ADnm3KfOzvH8BDA
	4jjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1662397142; x=1662483542; bh=Shh3LMvh5cLwa5Wm2j+dYZlXgI/h
	HnKoVcHSaX3pFYo=; b=cZujbKDMjXgAqlvzrgpxup09Ho811nobuz+zlfEnAx+6
	Z44Ow++vm/jdKrzUzluCvKPfeiwvZeWjot3MTJ44Dj4CYXhdmNChFdOnmMIsbp9+
	B+JUJcG22nuFYOTKNoFa5hmVPfWLY/r505lXBE5kKRuMl5jiiDF0Ff8irC7KhX5X
	nVLP7h6l/28P4BoYkK4S4ozzNPRfJyWXB9qghAJDrRlVHPNZKP8J8I0h7yuTlU1Z
	f8wwIkcnStafoIETTRiH84B0zexQCCAU6t0ufk664g4qxTN0Fb9S4rrySW6hLVm1
	j2NKbfbOoocVY/+FqapLwUKx7SPyO3pbPA1dz0CV0w==
X-ME-Sender: <xms:1CoWY3bpHrBs8shw7ltZW0wxDOBv6fG3PWUtZQfkxOA5SWgYkhlHPg>
    <xme:1CoWY2aHp5ey_pPRfdm1ENUV93Dwh-8osSQyC-ErhK65_VX_4LMAb--0gZ6aWcWXq
    CNbNVxFHhdxxnzJuGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
    frrghtthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefg
    hfeiveeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:1CoWY5-iYlPmNvTqXpcnVJDKseo1mKDYnmjLIxwRgbAb_OdeysSg8Q>
    <xmx:1CoWY9qDkTDStzSqn7LWr4D-DiIYM9FWq9v76PTqyYTxU4oxv1_kbQ>
    <xmx:1CoWYyrEpj96WMnbIPtwQ2ASzKcO5Z74dZl7Fy1FT1pvu-0p8JPofA>
    <xmx:1ioWY1VWyAkTgmdG_3_ehB8Bqra7oAqpNG7xtC4nHvbIugLuCmkH3A>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C5DD7A6007C; Mon,  5 Sep 2022 12:59:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <cb47e092-bb63-475b-8953-c4d306feed6c@www.fastmail.com>
In-Reply-To: <E1oVFHG-004pua-Dw@rmk-PC.armlinux.org.uk>
References: <YxYoW2IZFK/JdKgH@shell.armlinux.org.uk>
 <E1oVFHG-004pua-Dw@rmk-PC.armlinux.org.uk>
Date: Mon, 05 Sep 2022 18:58:40 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Jassi Brar" <jassisinghbrar@gmail.com>
Cc: "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] mailbox: apple: Implement flush() operation
Content-Type: text/plain



On Mon, Sep 5, 2022, at 18:48, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
>
> This allows clients to use the atomic-safe mailbox API style.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Sven Peter <sven@svenpeter.dev>
