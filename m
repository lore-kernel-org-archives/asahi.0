Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.66.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601878;
	b=ZnMaDwEUb2IVz2dRrkGph/nWhIY1nnYZ9nOrx1j+jbxRgesYN+0RAQrqJyYFXAj1qhsh
	 7kV9TU3tGf0gKT5KsWvKEWdG/CWme1Ik4L63DQg5g4w1mXeFgCgLKTjfeVcF//5GgT2BU
	 YjtpyVKd6AgtSczFFwX9eXY9Utvp7LwlbpYotMTyBRJwIxDoIll/cHEkgAOPl2QhE4Q2J
	 nqMTGdm9iTA2vdu4+uWG6l+Cdv97Ijte8fO6l9YDiU1/PBMpSJv5Vr7PBoodRJsR66hAx
	 9+HNTxctgPlYTXCw0SFKQ5SjjmU4FhTy2XzS/vFDpnPsCSwZugAXoMN86bR9MaR49mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601878;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Info-Out:X-JNJ;
	bh=HMgjFT/9KLQi4aDCvbmUqhl56xbnFHYqNdOa5U4XbKs=;
	b=SL+jxDqD3/ld6ediWeZrRKHetpBE6BNlCht4wYSumGKnBJwPJOjYEgTIKYkmtlB0/Spp
	 vN3QzTg11/6mbRUhjET3gqERdk17XLfABmxw/TCsaLB2nAAKJv2y3tujqbL9JmDkMzJ7l
	 tVeRScyn+Qxp875nC0HFtVf3Zw0P5lMV+///zz8Rl1IQuC7RB43yZlsxEdT6l5/3cplmu
	 rIdG6S4wlhVu2QBLJPGVwi6szV454qMJJy8bu5RrB0EWyXg+hXMGp/Xn7HKrDK4ih+cyD
	 pcqvZ53W8K4L/gHeGm49wuwWUnfcR3bSmzsnGPDGOm15geQs+T7ONpNZYc7ZirLFe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=LIp9YqfN;
	arc=none smtp.remote-ip=57.103.66.145
Received: from outbound.pv.icloud.com (pv-2005f-snip4-4.eps.apple.com [57.103.66.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980C606A327
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 10:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7980C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=LIp9YqfN
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPS id BC4611800165;
	Wed, 25 Nov 2026 10:17:54 +0000 (UTC)
X-ICL-RepId: 01a21236-3f25-7455-9e56-d9f773a07330
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1795601877; x=1827137877; bh=HMgjFT/9KLQi4aDCvbmUqhl56xbnFHYqNdOa5U4XbKs=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=LIp9YqfN5cW/9Pf/yT3+AH8LGeNpg89M/IHIvr7vyTY3gfWaL56Z43Q+WzgSBQBiNNR6FOD22vOuq6sHbZHOL4ARu/4oGsEN7lIRj0iw8ZZP5HlSTdTpA2jm2htB/hZKMS1wjm0qGjiodgjN4kBR0Vu2poC8eZzioJzRR+WKmSDlTGzPhzSA/30Yt4KpEr5sL4ifGB+fHZf4nlaUoZT+oLAChyvZSViCHHdGjqdksjYkjjebUIWcJq5b94sPF/TX6CUyx/hvgXiCSUPvulNpNwRsuR/djEnEEoZQPfGchfkFGfUglzyjHer7ZbDIPWvvp7PMcMD1ClXd/i0P4Bg6BA==
Received: from m3 (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPSA id 493231800249;
	Wed, 25 Nov 2026 10:17:51 +0000 (UTC)
Date: Wed, 25 Nov 2026 11:17:47 +0100
From: Sofus Forstreuter <sofus.c@icloud.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 06/17] media: apple: add avd driver
Message-ID: <awa1y_1q65mUKIKU@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-6-85cbaa2125d8@icloud.com>
 <4bf91d773c7c2bd8c3b04210eff7869169f1f382.camel@ndufresne.ca>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bf91d773c7c2bd8c3b04210eff7869169f1f382.camel@ndufresne.ca>
X-Proofpoint-ORIG-GUID: NEQx70V1N0Ja9yPvIJ3YL5qSTmGOPOQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXyoWAECU6s1bZ
 gZq28LPc52XeJoLBdsCYNXwtYp1EJsRfmbnnlGL7GHXSwj256jibx/Xc6Jy1iCNG4nhr2npBedS
 heuYdvk+Xqu4wIHJFRlfz29FgwHuMtEf1FAckL8DWXT8jq4wvlbnYhnIPTD8k7wMn2h8in9g2fx
 9CZidMjyDcFkIpzS02y/B09lREnSgi9yzrr14QlhBK/mcS8RrFrTO3ZY3f8RjNIKibHGTDENkb+
 rfNt5JWOEbOgCE8jBK/hO8Dq3+VSdTh2SF3abhrSLtcyTNYEbgAU7c5g+qX4yo/ow3biHC7kx+3
 2sIUTyw9SOlNQLPTsl7kJwxAVQ500n1Fs6YidWcF0DhtP0g4tlq0qGECirkOzQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX6ikqT2+wpUF/
 TovpS48W4Ut6NTtF2phFPOnzN4hXzcwWKkkpy5viS7kylq/Ua0yhOIuOFr7x9d2gfisAfh0zGwM
 JC7ECyGhABqijjP2OyKh6UQ/yz0GcnM=
X-Proofpoint-GUID: NEQx70V1N0Ja9yPvIJ3YL5qSTmGOPOQY
X-Authority-Info-Out: v=2.4 cv=OJCyTiaB c=1 sm=1 tr=0 ts=6b06b5d3
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Lz8lNifEoAKVmCoaIBl5:22 a=zaE7u2tvhngv6054aE9a:22 a=v3ZZPjhaAAAA:8
 a=bBvFI2eh8D1WkcQH2k8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-JNJ: AAAAAAABgCjae5fMQLpZjBaYf+jzoBTVz5u0ZwFF4w8kqRziAbbEfLMnJnOPXI+A8K/0Pw
 P38Am+4gdLvPDvalinQ91qt93WniZIllG4dV6OIF312OWIyXS5PPJ94ioYAsuRTQhbH32t
 6P/aOtEk4PNwfHMgiAiQlBXjRkeJk7rqZqIIsb3fKJ3BBHUMY14B2AO8z9KDb9rQvGwUDt
 fYAdqBHbEhMi2N0gyYP0a7Mf0LmMPkS601QCiJOUxKR8bRCwhfFm6DljjvnW1va2bQ0CXp
 E3k+y7nAvuWjqE5E4WYVWHtT2SEgV2UABRGCJuHT2ADeySbacAlKjHzqEsXePc3Z8/pzib
 xiQmz4KKTEQuh2xrnK9eisuL5mBxUdSkgeVC5ybH0vYgAjOTAqqz4bjK1uxOKl74zADv3g
 H12Jr5+zkPZPYMUQk7Jf3/Jy5QJIIRbFSUitzzqH06McQhuPe7uMu9q3u5iJ/2RJlR8TJM
 BNPw4pTPi0wKTAO4IB1rfdIx9Vv5+ik2M+93z37fc9ptxuRqDyAC1+VWKD0OSMq1dMfJNg
 GLGOyhIfUJH7vUzuyx2FF/pyUbSRRooy7kaaREW8areBbR5LvC9pwAlNL+zZ8rLVo5XFD7
 ZHw8mry0gPvT6DfTWyhvaKwZ9kR3UlvWNN8vxBdo7ypw7BirmXb3xXTueWrzDruKB9yUoK
 3J2XK+E2KrlnNGdW5Gkt4CNnOze0YS0cs49Sk7EK8oYmW0b/dOrbtenImWFNKSP64P7K/n
 oN8dP5saoiWgtJJO7f5BZqz+LukOckTDpZ1YSMMoRjo6w9Y41SQBZdK7IJUEkyU+6EiqAB
 0mllD0zNutHBhjoMREzuVN2YlVND4F7T1d+cItbrBlv3xc938sW6vLlbrGpG2/8YlSatIJ
 jAy1mGbb2Y4CdrTiflgTSGvJDkW3vup8WYE0Z9RjOwc8lOPmNA4wlrwi4PWHD5Ddn65yZ/
 /sLT0eZk2nYUnRxk8FXe2uOIXvM40dHzoGS46CtonvjZ8SdC4tg0Sa4FGYs6bDTXKEWVJy
 bEAB2PF5EnAnxwVv1RPq7Loi6H5tC3J8PsInN4D1PPuLFYlvSkb7t3Mu/TbMrTQbg5Hse2
 MvUqqYcrpLnYscnU/okkLA1c0YtpvHuAe1aQckqIc0arKl3cwUXXPjX/PIvkOXbjPYn3UL
 r/xZE0DpoRGnswLfwNN4p8ddfZa1wzEWtZKlp/LdBT3SX4eKYZeEQk+lrtn6cUNM0Dm/Vo
 1fmPFCLMDsjy9zT9n8UjSkQa4SjwqU8lKDgOmMpDjNDylLptqvcwJdRqY0ZLwkCftwkVBT
 lGUOTKjLL4iPRRGHXzZoqf9FiLBjEq5S52Dz0a46oXFHXzQqDQ8gZQhwKstq6E1IdAD+iD
 iwESP4tx85I2lvqJ3x+4QebsgywREiOQ

On Tue, Nov 24, 2026 at 05:26:56PM -0500, Nicolas Dufresne wrote:
> Le mardi 20 octobre 2026 à 11:37 +0200, Sofus Forstreuter a écrit :
> > Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
> > support based largely on rockchips implementation.
> >
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
>
> Check you Sashiko report, and below...
>

I will check Sashiko's report, drop the double blank line and add defines

> > +MODULE_FIRMWARE("apple/avd-fw-v2-t0.bin");
> > +MODULE_FIRMWARE("apple/avd-fw-v3-t0.bin");
> > +MODULE_FIRMWARE("apple/avd-fw-v3-t1.bin");
> > +MODULE_FIRMWARE("apple/avd-fw-v3-t2.bin");
> > +MODULE_FIRMWARE("apple/avd-fw-v4-t0.bin");
> > +MODULE_FIRMWARE("apple/avd-fw-v5-t0.bin");
> > +MODULE_FIRMWARE("apple/avd-fw-v5-t1.bin");
>
> I believe these are made by you, did you publish them into linux-framework? or
> do you expect them to be built from source ? Should be part of the cover.
>

The plan is to submit them to linux-firmware. As of now they need to be built
from source. Will add it to the cover.

> Did a light pass for now.
>
> Nicolas

Thanks for the review!

Best regards,
Sofus
