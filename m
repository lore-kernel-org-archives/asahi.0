Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F41094E
	for <asahi@lists.linux.dev>; Wed, 11 Oct 2023 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYMpOSJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1F8C433C8;
	Wed, 11 Oct 2023 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697020326;
	bh=YpVnFf88K6rUjKFbnY+e3X6H6+xalRDI8tt76wKoDSE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CYMpOSJ1oBCEb9hjmwBTRVPjGnkNUa/B1J8J/u6Wi0AetVlMO4B00Oa9TGtB+0mip
	 Kahn9CI3WeICx7rspMYweeHhRPc2aYB0cap+4RwcDDVJ4VLAnErEeSPnql99DIMT28
	 fhTnCDKIJb6uRod2yFaAf7B7CZppj7HJRU9sIYxFmUcvlCZY8mejyPCGBMY5gzhxlA
	 gNNEbcNN3RVR4jz3FYMOxbRkfcYysBiePpdLfoZ0d9y0QRF/SoVyDtnGDN20HbY9Dw
	 w6/uxycQMHCDEM9GkWnUEpYwP60yUDB1erG287tZT7oVWJfCEl8RMUrDWdLdAdpiG1
	 UNY08Ms6PNvBw==
From: Kalle Valo <kvalo@kernel.org>
To: Phil Elwell <phil@raspberrypi.com>
Cc: Neal Gompa <neal@gompa.dev>,  Hector Martin <marcan@marcan.st>,  Dmitry
 Antipov <dmantipov@yandex.ru>,  "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>,  "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>,  Arend van Spriel <aspriel@gmail.com>,
  Franky Lin <franky.lin@broadcom.com>,  Hante Meuleman
 <hante.meuleman@broadcom.com>,  SHA-cyfmac-dev-list@infineon.com,
  brcm80211-dev-list.pdl@broadcom.com,  Asahi Linux
 <asahi@lists.linux.dev>,  LKML <linux-kernel@vger.kernel.org>,  Julian
 Calaby <julian.calaby@gmail.com>,  Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: On brcm80211 maintenance and support
References: <6f78e624-62ee-3ae5-1db4-a0411566def8@yandex.ru>
	<CAGRGNgU7aySyUny9aG_+wXiKJ7j1weosa-rZDY4_WAXbq-3ABg@mail.gmail.com>
	<87ttr454bh.fsf@kernel.org>
	<3c5a3e7a-b332-4a77-51ba-bed3cad1e79f@marcan.st>
	<e1ee4d76-f717-a67c-8099-7b91192ba1ca@yandex.ru>
	<e470902a-35eb-9bb4-7a9e-167f985c98bb@marcan.st>
	<CAEg-Je-mpcrEoM_nD3_8A=gZhdWpn3hxfGZNEfGRNupGwRdetw@mail.gmail.com>
	<CAMEGJJ3jeOK2WbW7YP4=y2E0Z7GnffHiqZhgAmXJjKchv3jG+A@mail.gmail.com>
Date: Wed, 11 Oct 2023 13:32:01 +0300
In-Reply-To: <CAMEGJJ3jeOK2WbW7YP4=y2E0Z7GnffHiqZhgAmXJjKchv3jG+A@mail.gmail.com>
	(Phil Elwell's message of "Tue, 10 Oct 2023 16:35:37 +0100")
Message-ID: <87a5sp4fha.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Phil Elwell <phil@raspberrypi.com> writes:

> This is just a quick note to say that Raspberry Pi obviously has a
> vested interest in the future of the brcmfmac driver. In our
> downstream tree we use the upstream driver largely unmodified - there
> are a handful of patches that tinker around the edges, the largest of
> which is in the area of firmware location and being phased out - no
> patches from Infineon/Cypress, Synaptics or Broadcom.
>
> We're very much WiFi users as opposed to WiFi developers, but if
> there's something useful we can contribute then please speak up and
> I'll see what we can do.

Is it possible to run upstream vanilla kernels on a Raspberry Pi? For
example at least once a month take latest wireless-next[1], install it
to a Raspberry Pi and run some simple wireless tests. If any regressions
are found report that to linux-wireless. Preferably with a bisect log to
easily find the offending commit.

Testing patches before they are applied would be even more helpful,
especially for the risky ones. We have a hard "no regressions" rule so
earlier we catch the regressions the better.

I also wonder should there be a dedicated brcm80211 specific mailing
list? That way people who want to help could easily follow and discuss
brcm80211 development, and no need to follow linux-wireless. For example
we do that with ath12k driver.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
