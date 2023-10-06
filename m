Received: from forward501c.mail.yandex.net (forward501c.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93E1CF8A
	for <asahi@lists.linux.dev>; Fri,  6 Oct 2023 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="CO/AoQc7"
Received: from mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:5586:0:640:b3c3:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTP id 6D5325F098;
	Fri,  6 Oct 2023 18:48:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 2mb8353Wl8c0-bpdhOTQ8;
	Fri, 06 Oct 2023 18:48:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1696607283; bh=hBdl579il4TUGabtGmXDqgjI0VAhDoml9PoRzZo90es=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=CO/AoQc74uABi0NR9Y7RtlJ8Fkk27KdxcEBZg3mzNMK849zhr6PHPux5Oqt7fSf7P
	 cAVrsDm2VDqC9CLA8l+Ldu7YmDk/z1RDC4f491gKamdDsbhKNKM/ggA4j584GMadGv
	 OhsGbgIY6LsJVrAE/6JQbt85TKE4rZ1W5/xCkhiA=
Authentication-Results: mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <e1ee4d76-f717-a67c-8099-7b91192ba1ca@yandex.ru>
Date: Fri, 6 Oct 2023 18:48:02 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: On brcm80211 maintenance and support
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com,
 Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
References: <6f78e624-62ee-3ae5-1db4-a0411566def8@yandex.ru>
 <CAGRGNgU7aySyUny9aG_+wXiKJ7j1weosa-rZDY4_WAXbq-3ABg@mail.gmail.com>
 <87ttr454bh.fsf@kernel.org> <3c5a3e7a-b332-4a77-51ba-bed3cad1e79f@marcan.st>
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <3c5a3e7a-b332-4a77-51ba-bed3cad1e79f@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/23 18:34, Hector Martin wrote:

> For better or worse, if nobody else does, I'm willing to sign up to
> maintain the chips shipping on Apple ARM64 machines (i.e. BCM4378,
> BCM4387, BCM4388 - that last one I have bringup for downstream, just got
> it done this week) and partially BCM4377 as a bonus (since I have access
> to an older Intel Mac with that one, and already did bringup for it,
> though my access is sporadic). I'm already playing part time maintainer
> anyway (other folks have already sent us patches I'll have to upstream),
> and we need this driver to keep working and continue to support new chips.

Good news. Would you capable to consider some generic (not hooked to any
particular hardware) things like [1] ?

[1] https://lore.kernel.org/linux-wireless/20230703162458.155942-1-dmantipov@yandex.ru/

Dmitry
