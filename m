Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963579;
	b=Avgxg7j0PqOxuLGhGvukWYdpI63+fb/SdII5NFFRC1/+CuU9K7D6zEbPXs+JIFawXfaQ
	 wkFW/Nnk3KkI7H653qIOZ6+4F39ja6aR2Egjxq7IkzQQCHYQePle/TYWrDbv4HpjqFOr7
	 K0dwJLYoJcMlaiwlOKbsMFnhMU1ZxSkDMToy68iKxCiZGmF0R5RKhaD2F2Urta14OtY40
	 ZDwxkkJ88/Dk8wbRZcN5muCM/EHtY2ihvBK6nRzC2vE49/ulaK+C/Grj/jelGkU9bV2Ca
	 loszGVzn9Lu/sS+mkU8pNWlwqvxTNxPBlIjgQyJwHR1WNlZwmpSn6RTgLFbITIDu9rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963579;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=uOlICXe5m6UkPEsKQm5ZQ2HRTSw6FYz/OTKxqH66Wss=;
	b=FWTTHXExtFS1Bgp+Mur80JUmps5PuQLD8MeQ7vsewPrLRbfBBVNsMtFpq/ckqPlyq4qP
	 HcjSFiZKyPHpmciwy1Syvxq9rAEW7NjxDl34PND39VCcGFKpyr76vEn6STJ8qbVMfyCkc
	 fr7ikmLdhclSP75Nm4CP2tLfAb0YIjHi0iffkmJAbfyMW4g7YdNX0hmDwju9XDZEmNdho
	 VyJSuchZt02jB0ASNH/zTz4TnGUSilU3g2i3RKj5luG3Qcr75xphJf0hNC0u768fXLbFJ
	 2EWp0tZkltqsC+sJwV+xtSc8qNzfS2PHcZQNNd1I3X4yxphryLlX4FD5W4Axlu/RKAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b="h5JU/H53";
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC8C606A332
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 11:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC8C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=h5JU/H53
Date: Fri, 6 Nov 2026 12:12:50 +0100
X-Lima-ML-UUID: 21ffc2cf-d5b5-4b50-bff9-4d2e6e69e61b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793963574;
	bh=uOlICXe5m6UkPEsKQm5ZQ2HRTSw6FYz/OTKxqH66Wss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h5JU/H53ovbcvOj9+4xwyKZtltEwUv5agWdUg/jQ7GqdM26PDum6snSV/4YFPG1fG
	 SbN9TAjgfxPK/5YVKP10X3R5Isn2FdfgVTJLZ/lO/qPBcXkyEeB6WYP3onoGtXXKNk
	 S+0Yqu4DV3FsKXwQ8eODr8JhLbSt1M+D5EabULuP/rfjug1oxH4Jr+9bk86CaIkEo9
	 PzHG9wAM/xhyckWLV/9LsoPcxmoeopCG02BKo+JW//M4aTJvP1rfFCeqc5Fhl7Q0ST
	 +2fh/+4cTqdMSBESXqsp/AFlHnmnqm38p6GL6BTUM1JrWPF5DxRiqHyBAppirQm/KC
	 JdHIgN6H74zgQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, marcel@holtmann.org,
 luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106121250.0caf3299@kait2en-mbp15-1>
In-Reply-To: <5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
	<20261105085750.120392-2-dev@deq.rocks>
	<au1uH6uxtsw2vHfP@macbookair>
	<20261106083339.677cc75d@kait2en-mbp15-1>
	<CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
	<20261106113946.60c6c5f6@kait2en-mbp15-1>
	<5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
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

On Fri, 6 Nov 2026 11:53:13 +0100
Sasha Finkelstein <k@chaosmail.tech> wrote:

> Sleep. I intened to say sleep and I have no idea how I managed to typo
> it as stream, but that is what I meant. Sorry.

Bwah! Well... np. But you know we are using s3 on T2? So the
controller will be off to Nirvana anyways. My last info is that Asahi
is stuck on s2? So even when testing with s2 on T2, we have UART
transport on the 4634 chips... So if at all the 4377 on 9,1 and 15,4
T2s is in question, right?

Andre
