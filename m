Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989120;
	b=SL7jIpP4m+JVDvMgHg8FrcBYApEL2a22wlhNXrIsAQT9Iwte1ZTYQQczhng7cM6IqhU/
	 V8fvMuL3+bQFq53TfyCCv4RwnATG5Pk4Nj/sTgycGbyxVdUnT3Bd6mAL4O/J12klOySfX
	 l34Gi3IidoJMIEHXUMo6Ui2E0BHTowS7OK8ixfFrZ0fXkb0KVxoIgNLlQXWhy/2UB6KuD
	 uzQ71yX2d8dlFqwyioIz83Uz4WVoR+oZkd/YIy9IMyzCkvAjm370m72MB8cXv26IdFgh3
	 +lWrItbKsjpk96/D3ErNe8TrEnCbYB+2egb0bzJ7n6RZXNf2eGZW7QNVOzxB762P4NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989120;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dyygcqcAN6zPeXsDXub4yWu3eaYgS8p+qfGLoA+tRmk=;
	b=XWahTQbw1TqzUNLXmVhW69mnQCURHv3tYUEsuGPsSpms7iOxy2j/pRPUqS1Ru3nO9m3f
	 kw/ulmT+HQwF+mwjP2ZBMxFKhpzBt7jJxH0KzJnoU5Btcr5wnvzx6IW4vdr0XFIK9xTfU
	 urvYR6Yb/+WHikrR8XopvOznyPbR9gki6FSQBruB7SxxRkMxhbWzSNrOlD/0EJh1FFUTK
	 mZ3uAmYPPsexQZIiECrrFk43RwX/Wn+PE1qI0v6OLDUUJleFisWk8mpzdvSIhZxvnZTir
	 DF8QbItIR7Tc6JiVEuHVx+XutSlQ64qPWIfS4Qdc6nPp7bR+GPdKccOA1upMN00RGwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF7606A32E;
	Fri,  6 Nov 2026 18:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEF7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Date: Fri, 6 Nov 2026 19:18:26 +0100
X-Lima-ML-UUID: 52e3c1d7-73c4-420c-837c-f7ae052149fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793989110;
	bh=QKKFbfCa9dHm2YxFOGcOT17+76twgyOoEkQPZtq3Y0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ft3ZTQYazgHJy+WiOicPJcdpdkn0Av1qnb5U8ypS+7+NwSnstj3u5W5OQ7i+LxZcv
	 dqQv1FMGNoXEfpKUelayYiq5xLIAHld+EOG46Bdv9KCwyi4y2BbdD8K5VFM2MSCvqj
	 NcMr3O1JWGDe11wiVU6xi+r9l7CYoUFND5rtTkJ+i5q1KyfpjX6/M1Ou6XVPeWNs0/
	 g/+GYf3xTU9B4Z2Tfga6WhoIGJ+qEga6y3eA9BSB/uwIvF+6IRdpS9a0FA7KOanhpS
	 7iAFFMX3K2cT/KOSR42AOTyuyruQPTGOa7mWvgU2z6TzFH+0W1+XxRwoR8tAvzbXIN
	 flBdU7MnQin/Q==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
 <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>,
 <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>,
 <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>,
 <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport
 with firmware
Message-ID: <20261106191826.4ddb997a@kait2en-mbp15-1>
In-Reply-To: <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
	<1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 06 Nov 2026 18:36:52 +0100
Arend van Spriel <arend.vanspriel@broadcom.com> wrote:

> Sorry, you lost me there. What is the relation between the patch in
> this subject and D3 ack.

Hi Arend,

D3_INFORM and D3_ACK are mailbox messages, and 05 changes how they are
exchanged. Without 05 brcmfmac writes D3_INFORM to the TCM mailbox
and our cursed Apple 4377 firmware on the 9,1 doesn't read it.

That is why I mentioned the D3 ACK timeout handling patch. I
submitted that because I was sure the firmware wouldn't send it.
But actually the transport was broken.

https://lore.kernel.org/all/20261001085308.1688049-1-dev@deq.rocks/

which was superseded by Sebastian's patch here:

https://lore.kernel.org/linux-wireless/20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com/

So probably for addressing Sebastian's issue this needs to stay
anyways. My memory served me wrong. I just read that his device is not
an Apple product, but his patch incidentally worked around the same
problem. Sorry if i was causing unneccessary noise. 

Andre
