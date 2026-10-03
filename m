Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE03A233924
	for <asahi@lists.linux.dev>; Sat,  3 Oct 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037341; cv=none; b=T1uwBG2UDEnxIwEHvVsLBl+35Lw5xZMYKpQ/0OzC/rE8fWWnlQWr1SKMKF7EuHuB9udd1gxY3GU9+b/8bSL5ddtKrRy9iCgpAx5y6EWvimF9pMMCxi9V9MtaYBeg3FLPxqrKNHnZF9qqrRd/5HGw+ywxgkkihv4qxB6wowV7WjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037341; c=relaxed/simple;
	bh=j8SoTISxeuImEvzVx48WhdNYp3ituwGtbkN/htg20EI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4DVi96mB8tWWIEl44bbnPA3+LQ5nPpyAgO+ZNCpBzS5Ie8QmiO/P3lBKXe/za2z8K9tOuPpf75JKqzhttng4Lg3Z9sIfqPozYuLpKtaRLLue45eJja/ma5W2NyGwRT4PKcAkaQm83qaPP9NTqH3Y6uho90fc/GRMx+QUtETUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=YImGM8T5; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="YImGM8T5"
Message-ID: <a8975c9a-b0c8-41cf-90e4-a770666e975a@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791037336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UYIospwFRvaHAndMVRzyTf5yTdHhAMhzoOJSJBaSM4=;
	b=YImGM8T5OGOECKzOFIKO68P6aQwccPbmQd6wHrPhR18cnhTcQE00pjUynX4YQZMqcBoXPl
	sS3n7yOZbD6dZ+S9sZgR9Xem7x+2I261ZvZo5tJ/XFCVt53Dlarf+Wt+Zz6ceg80wsdBb1
	lja4fSOW5jZI5MroBhXHsVSlJPpmifs=
Date: Sat, 3 Oct 2026 16:22:09 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] nvme: do not reset controllers in NVME_CTRL_NEW state
To: Maurizio Lombardi <mlombard@arkamax.eu>,
 Yureka Lilian <yureka@cyberchaos.dev>,
 Maurizio Lombardi <mlombard@redhat.com>, kbusch@kernel.org
Cc: linux-nvme@lists.infradead.org, hch@lst.de, hare@suse.de,
 dwagner@suse.de, asahi@lists.linux.dev, Sven Peter <sven@kernel.org>
References: <20260915095827.698928-1-mlombard@redhat.com>
 <94912d46-381d-4988-800a-6ef3b595233f@cyberchaos.dev>
 <DLV7F9W5HSFS.1D5WQW59ZEHEL@arkamax.eu> <DLV87HMYWE6U.BG10862VYDK@arkamax.eu>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <DLV87HMYWE6U.BG10862VYDK@arkamax.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/26 15:09, Maurizio Lombardi wrote:
> On Sat Oct 3, 2026 at 2:33 PM CEST, Maurizio Lombardi wrote:
>> Thanks for reporting this,
>> it seems that nvme-apple is the only driver that still initializes the
>> controller by performing a reset directly from a NEW state.
>>
>> This should be easy to fix by moving the state to CONNECTING in
>> apple_nvme_probe, just before nvme_reset_ctrl() is called.
> Ops, this won't work, as we can enter the resetting state only when the
> controller is live.
>
> Keith, I think we have no other option but revert this patch to unbreak
> apple-nvme until I find a proper fix.
>
> Maurizio


When you eventually propose a new variant of this, I can certainly test 
it with nvme-apple.


- Yureka
