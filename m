Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807214;
	b=MpI97gfNODHb9ZPtF7wz2feFu76P00isKen1dnbKhwJPu8ws29vcLm0tJMgTsR/v5Wnj
	 XniZBdbWWAQARYSpIfcAiH7PLNvUn2Co7JmcxfHC3qoaMG2xIrxlVuiZaHkF4CGjb5u6v
	 ma48xQnWjtM/vOgdUyEEahVjosVdPekdEfDEECvZkBUM7FAk0BDsfrUhStzSZRL53qEbZ
	 CEkp3puF/1jGr2UC+OE2IkmhZF9JQxwvfeuwCXpvUb84TECRV1kf7CB70WxJdBVCpC03O
	 LoCVAVIdf5arPu3bWKmKb/yTwRojkOnr2fwufmJMJiWAjHoHKDQR+aiFTBeqIRMgPdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807214;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XmyXgWF7QGVn7kMdXBMEOTW0Dzq4f3Xq1XeGtBa4Q20=;
	b=zcza0w2VvGsriuA8uv9kIpUPniBMFRBpB6VtnkUCfR7+miaNe73fsAKqzEoHIMFpxj+J
	 +6N0qRNkpk6/QrCr4WFzAknmfGbQdTeE9Crotzg0NfJwQiZqElmD+SyXy7WdUxKzvKRGa
	 bnlf9/AcW9qsu1iQnczbX3nW8ptThkuOI/7AqdOfTS09xsI9gM9xE40zdJqy3coqjRPux
	 dpmSIzk2o3GgT4UbKu6DF3EKoNBPFm+FEhmavGgq/fLuqR41dqk+nRhvpGq6jV7Boc7RR
	 biv4S4iMOywWdRgRZd8gqn5Pl41uONQESXEf9Z3BmAI6CCGy2fFNlPVsnb3TIT1gJ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3700606A337
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 15:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3700606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Date: Wed, 4 Nov 2026 16:46:47 +0100
X-Lima-ML-UUID: 76cb299a-8bea-43ab-8a8c-bd6afd96e001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793807210;
	bh=oZxpZr1GoCPpk0hXpo/a8rT6fD1pImgCa+1ksU/JwLI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FYoE7iVKLYEo/4MWGfSPFwlmBPQOEcY8PnQKfDWwtaXJ06vCJeIU1fhx86lHexT3w
	 OZqfosqFGDhw8Czwy5dzRVtnsIxx2IrlHIg4EDCVkRBtQDANj1HD8O3mQYPzdRdiPK
	 I1W38LD+vtxMBJiyE8HtAGSEwcKqh+RiQmHfNs9xPpTidski47v9sSCVKtGzn2N+pL
	 JIyl/ZiUKmW3ZYKseOV21oF6b/F0dbb355q8HKyRuXKhVW0vpJ80dqZZkLHR3lvnva
	 tYQ1Z1MQ44QC537e+jPlhj128ubzkM8pFFZGspcoBNKOSmuG33/2/msqKyiN9eHdsf
	 y4zltVd568QlA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 66ton99@gmail.com,
 josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, Yossef Osman
 <Yossef.Osman@proton.me>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE
 advertising report types
Message-ID: <20261104164647.5e9351cb@kait2en-mbp15-1>
In-Reply-To: <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
References: <20261104151601.70493-1-dev@deq.rocks>
	<20261104151601.70493-3-dev@deq.rocks>
	<CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
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

On Wed, 4 Nov 2026 10:24:47 -0500
Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:

> I don't think I agree with this being cleaner then doing at
> hci_event.though; not only is it more code but it also walks the
> packet which is inefficient and may have security implications as
> well.

You are right, the driver should not parse the event a second time.

What I would like to keep is limiting the mask to the controllers that
set these bits, as hci_bcm4377 already does with
HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY:

- add HCI_QUIRK_FIXUP_LE_ADV_REPORT_TYPE
- set it in hci_bcm on Apple machines and in hci_bcm4377
- test the quirk in hci_le_adv_report_evt() instead of the
  manufacturer, keeping the mask from 88397423671f

That drops patch 2 and replaces the revert in patch 3. Would that work
for you? Then I would send a v2 along these lines, with patch 1 and 4
unchanged.

Thanks,
Andre
