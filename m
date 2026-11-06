Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950427;
	b=wFjHcB1zBRH4we/HQi0xgMq8bxcAba3sZScOoBGHo+fqAUdSDGHYi/JPHQ8HlmHTET//
	 oIIZL3RMA8UqGlS29dNybESHRFqJ3gHhfmaqMsNZ9v7Icccp0lMCLqJb4HG3Q+tiio6hH
	 bmSVMVJfsRZA9MhQtPYOAo1EFl9x4Mb6s35ZnvJZ9ayMCuPvpOdcSnlg2V4KWko4Ei/qw
	 GIYuOSolakKEaqzRZs7t0hFbb32VbKaMNmfKxLoJvgqF99UXMtrFQsBTxQnX+DeMBE6ni
	 1QqQSPeJ7GLZeyUlh9dh+LvcT8xRHK2RA66F6H7Ns3ICugifNLpYlidfZsqHzS9v9YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950427;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rKxzvGAlPRe95V0pVMlRztyt1v5h62ch9oQN2DY4Clc=;
	b=qBSTz0pImiLX8sjPCbcpaAC/MaUqZQcHjYRVIK8O/NnEBlKLtMgrfBLG6d1kvI4DZDFk
	 BkTbO8xzM9w5aWZ7rjLcQz934Fh5m/Szv+1qnCUpxtSR+h0SOD8jirvGGRNgX/Iq3mYSf
	 L6ku8UsT24eCUpv+CA9qgxdL5rd+YqcpYPbiG+k64nekNjXEtQdv9te4iG1fwiGVTo621
	 TsyhViDKUBtb8pCjHo5rEXCrvF/tE+6M1f3dwQlDaIA+zl0Xkyrj3cj/w2k/mIC+/3AtW
	 3naMUuOPoGqTpmLqqWeCaqxffXddrkpToEdAezdbUGv756w7f2/LVMIzGHVVYUypoWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=r3862YK+;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F758606A326
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 07:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F758606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=r3862YK+
Date: Fri, 6 Nov 2026 08:33:39 +0100
X-Lima-ML-UUID: efbc4d95-1bba-426c-9435-09581e33fd37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793950424;
	bh=rKxzvGAlPRe95V0pVMlRztyt1v5h62ch9oQN2DY4Clc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r3862YK+9lpiv6qXkmsupUVvoPmKKTuMSkwmoXBtEt1J2UDdsTGZQxuZaWt7uV1Z6
	 aVB3DRULdeJM38mX2EwLQ4byQeH3TFmfP4nVeTiduKUE2ty+lAw1MG2XPWjgduG55v
	 c2izJpRl2HNikrx/vcy6cU1U3ApgLRU5fUxW+FVFsf9kEvMG5xyDtP9n6UlzzXbt9b
	 ygBAx8VYgcCEBKBs5OwV51TyDPv+haXs0MzCeyu7afPXUc7njU+bZxE5ond6DiVxO9
	 0nm5Ef2v4Qry4tTJ5GfxccylX5PaZJceG7Uawu266B74Ln0S/aHn4nPae3u8hhhrnj
	 V07HqlsjLQ3CA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Myria Sarvay <myrialsarvay@gmail.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 sven@kernel.org, j@jannau.net, neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106083339.677cc75d@kait2en-mbp15-1>
In-Reply-To: <au1uH6uxtsw2vHfP@macbookair>
References: <20261105085750.120392-1-dev@deq.rocks>
	<20261105085750.120392-2-dev@deq.rocks>
	<au1uH6uxtsw2vHfP@macbookair>
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

On Fri, 6 Nov 2026 17:05:19 +1100
Myria Sarvay <myrialsarvay@gmail.com> wrote:

> Just wanted to point it out, if you hadn't seen it before, that Sasha
> has in the past sent a different patch [1] to run these priority
> commands. They seem to take a different approach to when to enable/run
> them. Wasn't sure if one was better or worse though.

Hi Myria,

thanks, indeed I hadn't seen it. Sasha's approach is the better one
IMO, it only raises the links that carry audio. The dropouts I measured
are on the BCM4364 of the MacBookPro15,1 and 16,x behind hci_bcm, which
only needs hci_set_brcm_capable() on Apple machines on top of Sasha's
patch.

Luiz, let me tinker. I'll drop 1/2 and send the hci_bcm part on top of
Sasha's patch once I've tested. Then we should have it nice and
consistent.

Andre
