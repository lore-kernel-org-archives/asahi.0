Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288548;
	b=Rza22k/SCBmNS8IEaGumov0v1FrxG8EBs7Ra+TVY7ekFSQiJOYIe20g9XoWvtCNQCk+S
	 iFeCceWz2aQP5S51Glo3MOHuDpkx/gcHaKHe2iqSonM6SKpeXHi+L/6hCSIDxsHLPT/Bz
	 E+O6KIfEfoviElMWbs0e34py03szfu8pG/Vi/oTSkeCADuZKDE5R2gT1JipSE6ithbmvd
	 UWx2Y29xXb4eMI9VuuZKR/Wda8qhuBUQVuwz7+kWX6WAq9kLCQEjLZTwz59ZrA4N6ue92
	 uv7HE2v+V+I+wpnecsH6ED7IxVipNwu7SPG4j21OKH9m+eusGpohRdfbqqguinTgwbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288548;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To;
	bh=Hi1ZL/P6xTwIFqhtVwLPu3VRn9H34CRK9uafD+p4DyE=;
	b=jDKulc0uLD4RTuM80h26iWYp6yvdDASlZ9tM77MuP7IqGiE0HJwa4NFIMJEUlxwgyWxo
	 0Dkn2pX/tDbfriWPJKYT67+F7jvSqfP00gTZ9aJJZYkPpMeYzPqK87MBcUkURFzAsjBXG
	 kmzeAmYH/e3Ed/y5uTx0KYqdBMyQm5cFGeDeSI0Nua2QcUnngvO9KyWky8OgIv/xpw4jA
	 P+DpncMb166Pe01O/591ag2C6MORtOweaFwt1h3KWNKMUN8hOgv2W2cf7QwoMYd4s2Yac
	 iO+eWP6jAO0VGU8W4/0G2tCm3BIShXmNM95OU0vCGSOktLg54jc45VXFe3HgQ9/qC3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Nsrn3EDa;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0E606A31C;
	Thu, 29 Oct 2026 15:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Nsrn3EDa
Received: by chaosmail.tech (Postfix) id A043B1C8AAF;
	Thu, 29 Oct 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793288546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hi1ZL/P6xTwIFqhtVwLPu3VRn9H34CRK9uafD+p4DyE=;
	b=Nsrn3EDaUl1axthWNFon0U2+dA13f1L+vVnts30Oh3yVZBVUUR+B5XnWSpOkjv/V9GcWRI
	ewb8OQpnhWxOmbTnboc3e7UVtSWF/fmXK/HbIvxXDnKKUex+Xe99DbwEOEK26ZeZ2xDlWT
	Us7sOzT/XDhsHTcNPUT+Oeu2qg7dUjU=
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <12988c8e-95ad-4989-a6de-e02af3c9ef1b@linux.dev>
Date: Thu, 29 Oct 2026 16:42:12 +0100
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 alexandre.belloni@bootlin.com,
 andy@kernel.org,
 asahi@lists.linux.dev,
 bhelgaas@google.com,
 bp@alien8.de,
 brgl@kernel.org,
 dave.hansen@linux.intel.com,
 dlechner@baylibre.com,
 dmitry.kasatkin@gmail.com,
 eric.snowberg@oracle.com,
 griffin@kroah.com,
 hansg@kernel.org,
 hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com,
 j@jannau.net,
 jarkko@kernel.org,
 jic23@kernel.org,
 jmorris@namei.org,
 lee@kernel.org,
 lenb@kernel.org,
 linusw@kernel.org,
 linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 linux@roeck-us.net,
 mfd@lists.linux.dev,
 mingo@redhat.com,
 neal@gompa.dev,
 nuno.sa@analog.com,
 paul@paul-moore.com,
 pavel@kernel.org,
 platform-driver-x86@vger.kernel.org,
 rafael@kernel.org,
 roberto.sassu@huawei.com,
 serge@hallyn.com,
 sre@kernel.org,
 sven@kernel.org,
 tglx@kernel.org,
 wim@linux-watchdog.org,
 x86@kernel.org,
 zohar@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA128414-1BB3-4D04-9361-C870E0E3B57C@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
 <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
 <0683C803-C578-4C55-B893-BC03EBF9A9F1@chaosmail.tech>
 <12988c8e-95ad-4989-a6de-e02af3c9ef1b@linux.dev>
To: Aditya Garg <aditya.garg@linux.dev>

On Oct 29, 2026, at 16:25, Aditya Garg <aditya.garg@linux.dev> wrote:
> Whitelisting will create an endless cycle of upstreaming new keys. But =
considering T2 no longer is receiving updates, Asahi would be happy to =
send their keys they wish to be whitelisted right ;)>

Yes. We are willing to add additional entries to this list should we
need to expose them to userspace. In addition, the current approach also
needs more keys to be added to the list, as despite the claim in the
commit description, it only rejects a fraction of the driver-managed
keys (I do not see the GPIO or certain battery keys, for example). In
addition, the read side would also need to have a list, as certain keys
are read-sensitive.=20

> Fair enough. We can restrict it to T2 Macs, and Asahi can later adopt =
if useful?>

This outcome is acceptable.

