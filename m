Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B174F1A59C
	for <asahi@lists.linux.dev>; Sat,  7 Oct 2023 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="NT94CZh0"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 8EF3A42617;
	Sat,  7 Oct 2023 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1696683062; bh=iMMy30V2RH8HcFAxtufW8zJaG9pqEhOMkEXIgIHkq3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NT94CZh0cDdfJkYzwtrEiGKhibKhm24cN9CWUZKfKgZeSV/MiEj79eaefgp8L8/e2
	 EYLkGQ/azhx2fp0nwbBpEqNoF9jhCJPMbDvF6Pjhu6GyTR6ItH2ezD7v0UNBZeGp6L
	 ANzPrfjfpLt0629j9mNVucxqwVEq2KERadWPmRlTbjyUS9+QMFDaLPXf+G9+ZXfAfi
	 zElfJmGxuVXT7VIKcL+lbyf224yf8jWdQr2VtZz8TcK0+cyyfbwiZsbescfeVWPjmd
	 pQb8mWRVCEVdM+4AsXZCRP7SPcKarphtPdRrUGUfjDeRMfjkgEjj0W2U3s5fUjLWwt
	 BfEbAqK1z0n2g==
Message-ID: <e470902a-35eb-9bb4-7a9e-167f985c98bb@marcan.st>
Date: Sat, 7 Oct 2023 21:50:56 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: On brcm80211 maintenance and support
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
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
 <e1ee4d76-f717-a67c-8099-7b91192ba1ca@yandex.ru>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <e1ee4d76-f717-a67c-8099-7b91192ba1ca@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2023 00.48, Dmitry Antipov wrote:
> On 10/6/23 18:34, Hector Martin wrote:
> 
>> For better or worse, if nobody else does, I'm willing to sign up to
>> maintain the chips shipping on Apple ARM64 machines (i.e. BCM4378,
>> BCM4387, BCM4388 - that last one I have bringup for downstream, just got
>> it done this week) and partially BCM4377 as a bonus (since I have access
>> to an older Intel Mac with that one, and already did bringup for it,
>> though my access is sporadic). I'm already playing part time maintainer
>> anyway (other folks have already sent us patches I'll have to upstream),
>> and we need this driver to keep working and continue to support new chips.
> 
> Good news. Would you capable to consider some generic (not hooked to any
> particular hardware) things like [1] ?
> 
> [1] https://lore.kernel.org/linux-wireless/20230703162458.155942-1-dmantipov@yandex.ru/
> 

Sure, I've done cleanup type stuff myself too.

- Hector

