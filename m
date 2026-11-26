Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703398;
	b=WI9m6XHoLBjKhZECdmZqKDAWkdeBZoPxZg9tr0NJQAO5kIUTFk9tIJ5nNAoNI49lBpnf
	 JabVU0x3kfINB1jct1dp4HRzN92z7d54a0+6+izFczSX3dLpjXhGNNsF7abZ7uUGgn8nt
	 onZyEY3KOmsNjhmnQrXmIXD+/a9hAeLTZpw7jTBCV1DiHCgjGER8LXSHEPhbHPZztavWl
	 H07nd886Fhmxpmk3h5uTfgmVwpvYHVtfgJVQibyd4689+5qp+0eZmZt3QxUKV+cOb1NAW
	 rPrP4sFdCE9qtMUhHtf2Mt2pJ/jkHZI6RJ6xkQv8mMQd98AS/LkspvPiTq/3Sk/e4fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703398;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
	b=UQAMl45pZnZ0ij3yeggo1QDU6hM9jO+IzWI5XlgXMr0CMATSwyXAttvLAsYya4t2MhxE
	 dWPkPg0a/ybgJAFXrEPcWH/L///fapZKYMkqh382LTjEgX/biB9N9rJMo85kAz+g5HuNi
	 yjb23l/gfXjpsob5QWr0XdcAQTExGHvCHT7zaFk8ycnC7tREKpic8AWbC9LsFZE2hJLU7
	 Ojm08LQwyW51qcf4RKC1ohUkA9OpkW1/9QLayMl9nMZ6I0I8e8fPenvzRlZIWiDc7sqVr
	 BNp1jyGbqVUaz91k8eVmfinWVb19krtyNTiDhrCW1b/h2N879YI5yosE/UEl1IJs/8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LHdU5IOu;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FDE606A685
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 14:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FDE606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LHdU5IOu
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3169527a12.2
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703397; x=1796308197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=OHETkqrzmK+KaNio078/SL2GovFCJWJTG0vP4hDMvDGu+kBlSp3T6Xy9qXv7QYGUIp
         9FC/2hmgALnl7wqeT6H4cV56Swozxz640dSP5zBUXaStn2/l1fmv047D6vz3lR0AQyFq
         VMuYpbCjMRJGNnWGZ7RKGRArlb2AYk58lWMIVjMBuwL1QzXeBASW2Nq6c8x8XzGM2QS7
         wqiLNwetpPB0dj5oeYXU3QgsbZ1VHmjb5DMDYrUEzWqDDEHYhajKOgtBie//1z3j8qTA
         FDwYoRJ7SCJdF7AWf07gUZYOae70dF/rhruLzJkrSmsMTLDExJqdM+DviUkUGqN9sLD/
         ETGw==
X-Forwarded-Encrypted: i=1; AL+hErHl0OXQfz+QJtaso9gD3r9yIe2eYztAeM00sH2w2ZI0SrHHzAqLwHdBy14ekyz8IJOnN9t7XA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9F0bmlvCr0F38BRqxGeZMpcba9SKeY+RihFVy/xF/4bbM8pA7O
	DSrV4bQrZyka4J8A3AivcDFR9RowQ/tE7+gEUV5n8ljpeRWfhQp6BPSIW2kFvFqaTJEr74BeTOi
	dGCghpiYWmPJtoJ31URqUlny/2/kEpq9ZmPEfSMA/xw6ahodi0FJzaKWZkdnjQGOnqwSaGLedzT
	DBBRAsbebkJdefvu2JLcI772yM3sMXzd86CVBPF/bV/FGNdjc8LssLM7xuOA9CVn9q7IMj0U6vO
	Zkg5SPhPJjYjUDS
X-Gm-Gg: AZFdTZft1/qmO3X/ZXuFBx9EpV1lU3Bc9B3DJkKHHlHqjgH3T8L+I2yBBKkTjHAVfps
	mqSiq+u0LcVzObqZeTFmPPuctmxefCKWDLo+gQbR5Tn1BxX5kQP7QcCsOXIuo4QMUYd23faEySA
	LQntDgyigXJcIyj9UPzj3pEqEBf3BpRXCrGWWxMigVYTQL8v0H6tdWTQnqg89h7/ypgWtmXk3Lt
	gTpR9r8te0nxpeqC1dbnplAQ2qsGU6gkN4fRC/ky8ILtPwc9L5/cFfoVcnJNKmp39/9zOxQDhDU
	+N+J9+2J6bKpeGcSf45eV2/biXRAyMcWHwiJYDhQO1aygAIJs04oeoSnT1Xo1/bhD6BbjoJ54Th
	Oj7HUB9LZ8HCzuu7FgE6COV0lsfNyCxJd3S6pJsAorAIU6g4M5p939YV6KrRvlfCt14gQKoI0kY
	6yef5ADxyMrojhxKsUru5QZVvN8C2Agok6MAoHrXY=
X-Received: by 2002:a17:90b:134e:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b41c7b638bmr17137252a91.7.1795703396978;
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm15814068a91.1.2026.11.26.06.29.56
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55c950b47ffso110327301cf.2
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703395; x=1796308195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=LHdU5IOu2Rd2pp1Yk9522IrwZWqHKivXbFL2quSy4QiEHCdiLEZpGOjt2cVXj4RKMu
         6/Mgc7KoAjlFytzf47k09HULSQNPBrA0uwwnWxHuhkQmUWP9ZwfCkS9wXqJStddOt0SR
         OZ6G+cQT3QmrwOCR0xofDbSmmeZD7zR6q0g1g=
X-Forwarded-Encrypted: i=1; AL+hErGgVvdU3KhKOm6aZjyN8ta2VSrPU7A2fWfiD1Tr2wh3GTSsXEG1Saz2+rr/vlKula+gV4hubg==@lists.linux.dev
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66784111cf.5.1795703395494;
        Thu, 26 Nov 2026 06:29:55 -0800 (PST)
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66783611cf.5.1795703394993;
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 4/5] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Thu, 26 Nov 2026 15:29:41 +0100
Message-ID: <20261126142942.881504-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-5-dev@deq.rocks>
References: <20261111120748.23795-5-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 13:07:47 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request. brcmf_msgbuf_delete_flowring()
> waits up to 100 ms for them before it sends the request, so every
> disconnect logs a timeout, and the cleared counter goes below zero when
> the status arrives.
>
> The race the wait was added for in commit 0fa24196e425 ("wifi: brcmfmac:
> fix continuous 802.1x tx pending timeout error") is covered by
> RING_CLOSING since commit 09be7546a602 ("wifi: brcmfmac: fix scheduling
> while atomic issue when deleting flowring"), and late tx status still
> releases the packet. Send the delete right away and reset the counter
> when the ring is created.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The race handled by 09be7546a602 is the posting side. What 0fa24196e425 also states
is that the flowring must be deleted only after all tx status is back, otherwise
pend_8021x_cnt never drains and every connection is delayed by 950 ms. Dropping the
wait is only safe if the firmware returns the tx status of the queued packets on
flowring delete, before the delete response. That was only observed on the BCM4377.
Would be good if this can be confirmed for other chips as well otherwise (probably)
better to keep the wait for those.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -73,7 +73,6 @@
>  #define BRCMF_MSGBUF_TRICKLE_TXWORKER_THRS	32
>  #define BRCMF_MSGBUF_UPDATE_RX_PTR_THRS		48
>
> -#define BRCMF_MAX_TXSTATUS_WAIT_RETRIES		10
>
>  struct msgbuf_common_hdr {
>  	u8				msgtype;

This leaves two consecutive blank lines before struct msgbuf_common_hdr.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -1471,23 +1475,16 @@ void brcmf_msgbuf_delete_flowring(struct brcmf_pub *drvr, u16 flowid)
>  	void *ret_ptr;
>  	u8 ifidx;
>  	int err;
> -	int retry = BRCMF_MAX_TXSTATUS_WAIT_RETRIES;
>
> -	/* make sure it is not in txflow */
> +	/*
> +	 * Make sure txflow posts nothing more to the ring. The firmware returns
> +	 * the tx status of the posted packets when it deletes the ring, before
> +	 * it sends the delete response.
> +	 */
>  	brcmf_commonring_lock(commonring_del);
>  	flow->rings[flowid]->status = RING_CLOSING;
>  	brcmf_commonring_unlock(commonring_del);
>
> -	/* wait for commonring txflow finished */
> -	while (retry && atomic_read(&commonring_del->outstanding_tx)) {
> -		usleep_range(5000, 10000);
> -		retry--;
> -	}
> -	if (!retry) {
> -		brcmf_err("timed out waiting for txstatus\n");
> -		atomic_set(&commonring_del->outstanding_tx, 0);
> -	}
> -
>  	/* no need to submit if firmware can not be reached */
>  	if (drvr->bus_if->state != BRCMF_BUS_UP) {
>  		brcmf_dbg(MSGBUF, "bus down, flowring will be removed\n");

As said above, I do not think the wait can go for all chips on the evidence of the
BCM4377 only. I will see if I can replicate this on my 43664 device.

Regards,
Arend
