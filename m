Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977616;
	b=ccuCo1MI2MZG0d7/cSEOl9X79PabTTX4XeS5c8rS7PCNH+VvZpsUm2oyhxTNTsot0uCK
	 zmmyc14eBuCDaOUlyQyPpFkn4IIE/xJK4IamFncZVzFrdRnaj7nIphwiIDVCPAHiGwuUW
	 3WYM/y+aLlTKb2yg9BIAU79Gsy+1JQoxs0XaRmIqeFvrszgQqnldBi14YvLfTsH2wUzIj
	 5kxeLsx+cONtwzIlLpHLhKbYdbW4wVzZh3iH9vuKBtcbw0DJqHgP2ZrO7hAW6dXaZlVlZ
	 iHy8fI5SWSWrYv0SoN/upxQcYTL/u16gYSFfsoB322+aycJDZmW4XoY5Uzu0jG38oKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977616;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=a24+d9xvaf+CDIz2+89Hx2fexrG15RfEetPbz91IQO8=;
	b=ICA15ygx36/LFa6WlINECjkwL8ordg+Vvbklvz/+GV91hM3etqO63zC3N54okq6sdF3Q
	 XTOEnGmiaPNtl3vrvL9rO2qqgtIl8q8i4lMXk88hApr2nNlqLm7hY8ekqAo4gexD8rQ3g
	 CJgFsWDPxqhwYmm4zAy2Xd8HsvKdwtztM73oVA1lISQpcebpcJE+LaEAvEs/VozE8t+Pe
	 eXNe2KEorBa98kFjWuxXu6RTwpSF/eYEsj/nlbCAf9KclQV1GKMZfjxSP1tUmPnFSR1MB
	 AwrdQDrXzH3VEfQ8aqD9D7/8lc6q4W+KDcwN42wZP6rpdhy0uAnNE6090WGmLJfeSjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=DcQqrWYJ;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6D606A330
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 15:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D6D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=DcQqrWYJ
Date: Fri, 6 Nov 2026 16:06:48 +0100
X-Lima-ML-UUID: 59084f74-4df0-4d05-8f4d-796d5e595ebe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793977612;
	bh=a24+d9xvaf+CDIz2+89Hx2fexrG15RfEetPbz91IQO8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DcQqrWYJrmn/TxAwJu3//ceI1EKsNKPNB8iDm6H18mLIZKbwXuz77tMxy2jzUuJoa
	 IUZ2hw0xefq1/6Im1d3mtxNqxYDmw4m+OcCHHZF/IdnqcQGJ+VoQQo43iHqRmXPaSk
	 YnXSFCJl1QLMYypmDUuFQDY3bNrV01msSjaXmFSzn1eBcW8DwKWqOo8os+EQ59X+qc
	 TYDxHRB/h5CdG+ccCtGn9shroQvEX84ZFLZ8Gy/DjoMyaOZcb4Qj0+O4Sv4xrQ0wNE
	 MnNR1H06/oBatRS969+5s12uKSIsXWFXz0Yq7UsN3m+Yqz/XpL9zxAsEktQl7+6PEi
	 wUY2Nb0VTg8cA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, marcel@holtmann.org,
 luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106160648.05117894@kait2en-mbp15-1>
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

Hi Sasha, coming back to this after testing

> >> You probably shouldn't, or at least base it on v2, not v3 (that one
> >> ended up being a bad idea and caused firmware timeouts, so Asahi
> >> downstream ships something more similar to v2).

Linux doesn't keep ACL link across sleep. The core disconnects all
links before suspend ("terminated by local host for suspend"). I saw
that with S3 on the BCM4364 and with s2idle/s3 on the BCM4377. After
resume my headphones reconnect and my patch sets the priority again.
On the T2 Macs the BCM4377 BT itself does not come back from
s2idle yet, even with patches 01, 04 and 05 from your 4388 series,
so I couldn't test there. Would need to investigate, tho s2idle is not
my priority right now.

Since connection time works on these chips, I'd keep 1/2 as it is while
being open for proposals.


Andre
