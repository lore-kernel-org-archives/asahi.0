Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCF42264A6
	for <asahi@lists.linux.dev>; Sat,  3 Oct 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791032998; cv=none; b=udVHMBpLU8NOlWwIZXKhrTwGQjOleaIY+vOSSIIldWCNhGhjVhnv0M4Be1L2/+lfaIraVo+JKhw6lkbOGu9vVB03tOJ3oCkuobprVcSgWbb6zpOzOUNmhbnBLuwr7WKqHQGfR63EdBsb1cHlOxN19NSytvP8lzAcnZO2Qk4zxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791032998; c=relaxed/simple;
	bh=TyfxVXOoBof91OwTiEmFt4WF3sFAvG5dlDx8dAIQTxM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aDUsp607NTmGOz2KP+lo4TLiTaNJZgHUc+C2mGgA6TjMzD9LV4Z/NxjkDqOTfdJQlfZ6hgrlVl8NzlSW2ge4yZUt/6LxGpwTmTzsVcoSUHCI9o07QwZY5BvhoxKtmracuoPmdTZU4rPEACcBGeQ2Pg5+KItNhRzgtTx08y5lLHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=IXot2zbv; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="IXot2zbv"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=TyfxVXOoBof91O
	wTiEmFt4WF3sFAvG5dlDx8dAIQTxM=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=IXot2zbv+fNlaVGZ8rueQ55Zcdpn4wV3EmL6W
	hg1TvcmSmToi3RA9ach7MMkJohxESdpSsFtKpml8eZcgUj8xj4nEKpL0nkJEKnbkotocvV
	X+dYTYLSt8ANB/nmNkjGapBwOKdPQ7f0RtAPhtw/Dlq6ZIXzKMpw5AkAUAu1aALVODFmaG
	pwsEsceDlFs1bqgfEUOrkpQL6/ZiskNqVyO2N+A8XlGOiTy40xRhOxzAv3o7YSZHL1UFMX
	tKE6xipSJXXuNEvtZd1xun/u68JpgwJcTmyfXZCKNmIr4YYnn51DtqTzgUDrYO+SYUfC20
	bibCT6hfKDJv6LC+0yAgjp4Lg==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id f2ea9b1a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 3 Oct 2026 15:09:51 +0200 (CEST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 15:09:51 +0200
Message-Id: <DLV87HMYWE6U.BG10862VYDK@arkamax.eu>
Cc: <linux-nvme@lists.infradead.org>, <hch@lst.de>, <hare@suse.de>,
 <dwagner@suse.de>, <asahi@lists.linux.dev>, "Sven Peter" <sven@kernel.org>
Subject: Re: [PATCH] nvme: do not reset controllers in NVME_CTRL_NEW state
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Maurizio Lombardi" <mlombard@arkamax.eu>, "Yureka Lilian"
 <yureka@cyberchaos.dev>, "Maurizio Lombardi" <mlombard@redhat.com>,
 <kbusch@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260915095827.698928-1-mlombard@redhat.com>
 <94912d46-381d-4988-800a-6ef3b595233f@cyberchaos.dev>
 <DLV7F9W5HSFS.1D5WQW59ZEHEL@arkamax.eu>
In-Reply-To: <DLV7F9W5HSFS.1D5WQW59ZEHEL@arkamax.eu>

On Sat Oct 3, 2026 at 2:33 PM CEST, Maurizio Lombardi wrote:
> Thanks for reporting this,
> it seems that nvme-apple is the only driver that still initializes the
> controller by performing a reset directly from a NEW state.
>
> This should be easy to fix by moving the state to CONNECTING in
> apple_nvme_probe, just before nvme_reset_ctrl() is called.

Ops, this won't work, as we can enter the resetting state only when the
controller is live.

Keith, I think we have no other option but revert this patch to unbreak
apple-nvme until I find a proper fix.

Maurizio
