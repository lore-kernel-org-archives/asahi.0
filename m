Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961594;
	b=Y+KQjnnLCq9fPY3TxO4QtBR0EIJd7JwXln3bt4e8dpL6oQraC/orDGD6n9HbeA5/ZdOD
	 qRlRzbPd9kEfrX65ODHTPx67MifAGUpbssUVlGAGWtGnFS48bxZ39pp7sctqoKS64Omw8
	 H5WSKdQNozS+4CwKxl5jl9uqUWJYI9v3pdB8TQxfZwiwn5r6meFEVAH4VrilvaidNNFpS
	 wjUZWyZVfuh0RaqR2vU7LPmc/zw3soOV0sWHwHwHAMMbWIWqUguIqy4zatyqL0UnNFw07
	 oBwWs1Z59hbl2IYVfmPKY5a1uCHzl0FfvU+60BBY/99FDdLeGqNL8BC/GFf9WqefJBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961594;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3Nk0nU24+meLVqI1sm3rEuY4RzCVvkveZrzwpOYwNYE=;
	b=MakOMMimiKevHyIqVR9pnwIWDbsfhLE7DbR0TDlrSHbN34SoxgVbVSFM5/ncYZ8jhkrd
	 gfnfHQhkGl5/YS9YOVDpWwjtYWfy+fNgU1pvuLAEB7cKuhq0cRWfxJnS8ie6BRM58xyPB
	 aoRNUZn0bV77tbrXfH3gZYb7X1yuQpZZxiFw16QcaXSn6jsSsMXoaoqD1HKwAvqA+u0Fh
	 ugCkshMljuTT98w6KR5eY+A1lVHe32vJUPoTI0v7KzDwQCAKx9dKSTYDcuNcPYLYiwuhz
	 pFKludBfByfbqfz+JgEQb0odxZWX2UmWFn1HgbmMGK+lczffXwaBClJRcnJYLbz2TyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b="cDWb3qT/";
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE44606A32F
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 10:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE44606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=cDWb3qT/
Date: Fri, 6 Nov 2026 11:39:46 +0100
X-Lima-ML-UUID: 554dd730-d676-4122-91f7-1c59d9d713b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793961589;
	bh=y15sNDWn90awgqBw5hBeSKcVrhfHO2rodDf3pddDytg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cDWb3qT/u6wg+nMEavmew+22jeSdKRDqohx2EHrtipzkYn+T9LYUUDohbAust8DWM
	 IStMWlE60ZIv4cBqdQFjVf9ZJGt6Im1FSzSMlSRGQlE+35xVl2F8QqhEFSCvDHQrIM
	 OYY8gnwlk7F8wcaCXHW3LGsESqhT46xTZXK9gJ7uC9dt/n+H+XJD0Z009NAtp7BQ/y
	 9nsk3WvnOasOzgTDxlpInk6WB6+mSTlIgfZTXcBJ/HlKnR6XZOmnVB5EZoONaK1OQX
	 4raLUYRZ4v8DDGXeV6EVFkwlEQ9DZdAh+d8HiY0T3V9l4hz7ESop3P0x4dGJmG5L/U
	 /wYFPqtcQKk2w==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, marcel@holtmann.org,
 luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106113946.60c6c5f6@kait2en-mbp15-1>
In-Reply-To: <CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
	<20261105085750.120392-2-dev@deq.rocks>
	<au1uH6uxtsw2vHfP@macbookair>
	<20261106083339.677cc75d@kait2en-mbp15-1>
	<CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
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

On Fri, 6 Nov 2026 10:40:58 +0100
Sasha Finkelstein <k@chaosmail.tech> wrote:

> You probably shouldn't, or at least base it on v2, not v3 (that one
> ended up being a bad idea and caused firmware timeouts, so Asahi
> downstream ships something more similar to v2).
> 
> In addition - have your tests included entering and exiting stream
> with an ACL link active? That part always caused problems for me.

Hi Sasha,

I tested both on the BCM4364 (15,1) with 2.4 ghz wifi under load.
Your patch (668d849694ef) and mine, each with a reconnect, plenty of
A2DP stream cycles and profile switches with the ACL link up.

Mine sends 0xfc57 1 ms after connection complete, before AVDTP Open.
Yours right after AVDTP Start. Both complete with success. Neither
needs it again when the stream is left and entered, the priority stays
on the handle. No timeouts with either. The short glitch at each
suspend is the same on both, so it comes from the stream restart I
would guess. Scratching my head now. How you wish me to proceed? 


Andre
