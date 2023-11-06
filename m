Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net [188.165.48.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B2525F
	for <asahi@lists.linux.dev>; Mon,  6 Nov 2023 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.146.143])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 124DA257D5
	for <asahi@lists.linux.dev>; Mon,  6 Nov 2023 08:10:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wwxds (unknown [10.110.103.14])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3C6D81FEB6;
	Mon,  6 Nov 2023 08:10:45 +0000 (UTC)
Received: from RCM-web8.webmail.mail.ovh.net ([151.80.29.22])
	by ghost-submission-6684bf9d7b-wwxds with ESMTPSA
	id 7H6TDIWfSGVAfQQAGogUGA
	(envelope-from <rafal@milecki.pl>); Mon, 06 Nov 2023 08:10:45 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 06 Nov 2023 09:10:44 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>, Sven
 Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Julius
 Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard
 <mripard@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Justin Chen
 <justinpopo6@gmail.com>, Baruch Siach <baruch@tkos.co.il>, Ahmad Zainie
 <wan.ahmad.zainie.wan.mohamad@intel.com>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Jamie Iles <jamie@jamieiles.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: re-order entries to match
 coding convention
In-Reply-To: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
References: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <300293570c0d29d5d4a39762121b5bef@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11495438051932285714
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddufedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjedvlefguedthfefleehgeeftdeludeluedvgfeffeevhfevtdehteejteefheegnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdduhedurdektddrvdelrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht

On 2023-11-05 19:41, Krzysztof Kozlowski wrote:
> The Devicetree bindings coding convention, as used in most of the files
> and expressed in Documentation/devicetree/bindings/example-schema.yaml,
> expects:
> 1. "allOf:" block just before "properties:" (or after "required:" for
>    more complex cases),
> 2. additionalProperties/unevaluatedProperties at the end of the file,
>    just before the examples section.
> 
> Re-order few schemas to match the convention to avoid repeating review
> comments for new patches using existing code as template.  No 
> functional
> changes.

It's surely going to help a bit but for a long time solution maybe you
could consider adding proper check to Rob's bot and/or checkpatch.pl.

-- 
Rafał Miłecki
