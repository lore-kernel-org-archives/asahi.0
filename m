Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475435;
	b=16yZg1uFWpjC48/K37cBzMGToMPKSGjZ4En+3tVNxYfwJ5rCP2UMl8It2receFD5ZQ1j
	 WTV8W06Um/5mJWTU48rqFXRHFqAE4Zn3ChRq7mg5wHSEG5T5Im12ROyG/b4+1nJzgtvlN
	 pWOTvRZ0t7LxxrAS1J9eSD5k/aCMDCaAgz5692REp7qmdBF/ecFIpNnPB9D0N+Jetl7tQ
	 fYo50Oo/zRcFzcJZn2qGsYv4f/7hbq8YUBn+FEdzW/v9fSDvv9n3y+uR7YAN6hbQpaOwS
	 ew+ohB5sZNcTVGfXWyQ7HK9NWoJFdpPhkHttAebO6c8v0ovxuVgmTakbdZuEWEKfr9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475435;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XrKTCTtL8bq9hcA3cLjorZe3ms1NOePAubxkA7gxev4=;
	b=gen8RappYr2x5BB8JgCW9Fkm9jHSDClRZJHctvG1RAGX6J3nJF36Kc67gjWng0jUAdHo
	 saSrkWNFtcd7cZubhOnmuZGmCP5vOKuqOL0pWD+e3B8rQPPBaxjLEzYD+fY8vgI3XsXVj
	 vwkd0H3fTSIAPRVkbluH60JvkIlIE0Ea1hG2PcKi1tY5vWB6L+xq9KYNXletJCSaIFnyR
	 GeOsN8xI8EOi0Omm3qc8qKB3qkjVZyueDR74IFnG2wcXDQ5PFDmqXV8DNo7IFpS6ZaMSE
	 l7FJ9qlu1mRwu4FwLhPlpejgrQ0T0BrIsgQZNzZhy3xIy2BL8oH4OiwEO6QJj8Hn9EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=rKO6UlgH;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24104606A88E
	for <asahi@lists.linux.dev>; Thu, 12 Nov 2026 09:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24104606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=rKO6UlgH
Date: Thu, 12 Nov 2026 10:23:47 +0100
X-Lima-ML-UUID: 4d878238-c034-4480-8c6f-18f3801a77d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794475431;
	bh=BJYPieYsm7wUZfSPxCoK9/u1+dJEmmjdYYatgOil7Uk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rKO6UlgHTeEb/toXHmvy2QbTBq1wVmOxoEXGP3+1BMuVeelvgS6jdhStcSMY7jeby
	 ZDeSjg5eVFGMsHeCSUDTsXFfgKrSnXofhlrucgBZdYsV78UDUL5KFYjmvkNBM0rzSb
	 u9j8TntSRhJe8TLw0wklEJOpinv+V0lwZGVbSK/FD9YMMEkcNpxj1l/bMXCKlnmhL1
	 t3n6TTEydlQPYPV6bJl7LkKEak2e/4wqiNw/GUd86A/LdvGKXLR5mgLJWZmdItbZeG
	 EzIG99XyPS7eztr0E7QwUvGdalp7M/mcdEzWWDSmPgjuVNfewMbJJzmOeO8tvXHhjV
	 A8o9Hn+lV9LEQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sven Peter <sven@kernel.org>
Cc: j@jannau.net, neal@gompa.dev, marcel@holtmann.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 luiz.dentz@gmail.com
Subject: Re: [PATCH v2 1/3] Bluetooth: hci_bcm4377: treat only negative
 hci_register_dev() returns as errors
Message-ID: <20261112102347.3a22966a@kait2en-mbp15-1>
In-Reply-To: <517d9d36-ab3f-4eb5-8908-f50aea59a3b0@kernel.org>
References: <20261111120248.21062-1-dev@deq.rocks>
	<20261111120248.21062-2-dev@deq.rocks>
	<517d9d36-ab3f-4eb5-8908-f50aea59a3b0@kernel.org>
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

On Wed, 11 Nov 2026 17:29:01 +0100
Sven Peter <sven@kernel.org> wrote:

> Please make sure to pick up tags from previous revisions or mention
> why you dropped them. I added Reviewed-by for v1.
> 
> Sven

Sorry, I missed it when preparing v2. For the record, from v1:

Reviewed-by: Sven Peter <sven@kernel.org>

Luiz, please take it along when applying, or I carry it in a v3 if one
is needed.

Andre
