Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF8439351
	for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 10:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382093; cv=none; b=Fkwf6W6A0HF2wgEn9gpYsv1YmUt/S5ZVBKolzKzKuQWOLPcNW4xZCZqFNYtzupx1SjYYqLHYpT6i02jDVy24/4qYRENSJZXFMM4yfPBabYGw9x9spM6V86bQ4Mr83aRAZ2qoEBv8eQamcFqN+zIIoi8Lx0GVxq0Gv4M8gGnVPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382093; c=relaxed/simple;
	bh=z4grfnNl5pEzLYB8FuYyFsBKa7t++n0aZP5su0DrsKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYkjcZyDyi41BBcRmKlxztpzMEIG5DKHoSMLOVb9qf6bwywqTesTa77lfASdz+Df/b1k2PGQF5Dy2Ha6C86cTAb3Y89r77NWwqtAGDRVIC9QArGEIcOl+SXzimrsKw+5OXF2vJsTfKDBFcziL6VZSjhAol1DeMHk7OHhqurEXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/VxfcXe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/VxfcXe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48702adb1c9so388474f8f.2
        for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 03:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382090; x=1789986890; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzA4Ev9bFl4S+BlvHkgaYE+G7jqrAFXbwzypM6V761A=;
        b=G/VxfcXefySen71lh+3JbYiwHRJ1yTWCLnMnowohZqK0KKKebeWWAxFgFYnwbhOfZN
         A0FdkEkrFT+4gcSH8oGaNdQ7xr8DZWo1cNXinUEFR2BjLwem9/TWLuByMre0GwCbkGhx
         c9AqyDt3mrWHc+PoQtkDpX4ClQeZT7YX+LmcBh+At5yl+a4mFhRnugi/Pe7Qh31109ZI
         sQ6admIDgYkrZTxGFu0r5/ff1EOLJkIfmRimLehsFeuZNB+2zxbX0D1WKn/x4qsLgsyZ
         VzQ3uQwHWt6tysxJwux6zUw2kJvaWWxdPiUOmOSuO+UMC5D1XmfbG4B6v1yKliGcsF6N
         VXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382090; x=1789986890;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzA4Ev9bFl4S+BlvHkgaYE+G7jqrAFXbwzypM6V761A=;
        b=ffjR6/IVQgP202BhKLuil70rxLIUbQhldUovXOQ2R6T+tYtu88Uh+xCwlrg1m2nJ8l
         2eNBNuYnG81CVzLZGvvOuq64I2iUbhr2J/tZMMYOxg324yN0psdkzZwYoDZr6h8UTlm/
         N3y17LXmuimXbfZFPDc0EjHfn0zrMQGy2BjrJ3OzgLR7KzIvEtMRVYhmdypdLQY2jEXY
         eG4KCTFHSjiABAZF7+kZwqLIG2hUOXkaZp70aCW9QBO/LqIb/Rcx13zlN7LIHIMZe/CK
         6CyTExEF/RH47dkMz3tLD3mDSom3lrL6Zbz/UWFxY2GIqdj+lAWX2HaKbz15JzZwT1SR
         gmRA==
X-Gm-Message-State: AFuF++lFU+exmBfYYLzGIpFOCqm+va81Qw1FUpjir9Nhq6QHMDDurlq1
	IIdI42DtS4X4o5pHuTrqfh/W64goZ2QXpbxaJemK3GkcJoEacQBXQ8qb
X-Gm-Gg: AYBFou3cFRdnEFAsx9pbflUhjxojYNmQIw41TdRHve4h4XSs1sUccCCKpCXwQkaBS3m
	gKdkH1jST1hcGxTHeYnzCfSNUzovOsUAfrjDrTxQuvsUJjfRfxmiuWO+B80uMpSCB8jJaOmq9sx
	3DpK/zPmZYIjQCrqrXETlPYrbVPV1cy4ckbDi+heCdTRSWBN9YkdP91Txgh8toNs7mUKlceWUrL
	wWhTtp1rlNI6tGRoRxqIgrDCdygOCLhGombzwzIPdDf9pej7F5PbrUrEa5pXbQDkeAjqnexrREV
	7J7gucCV3bubbhbBfaY7KnWxi/qGchwPb9ZIUf03S400iAIsrVSSu99tIxjACDlKpzzbJcB48k+
	oyFEs/b56HEbrSNM1iJX0f+Lb6rkWDUZNh5o4wOJ0T7JA0vG6eeI1I7R783nG3OtlxgC3Tm2qIK
	ZHG8BI7grSFutM7uiDbPoWo/QYXGMZe9P1df964lKjBKGUygRF8/Um6Lo9tt8dRwaQ7CM=
X-Received: by 2002:a5d:6f16:0:b0:487:37f:9ea7 with SMTP id ffacd0b85a97d-487037fa075mr1474421f8f.32.1789382090414;
        Mon, 14 Sep 2026 03:34:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm25223409f8f.1.2026.09.14.03.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:34:49 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:34:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-nvme@lists.infradead.org
Subject: [bug report] nvme-apple: Destroy the admin queue on removal
Message-ID: <aqfNxqqlIRbClbOk@stanley.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Sven Peter,

Commit 87d5b9864c81 ("nvme-apple: Destroy the admin queue on
removal") from Aug 6, 2026, leads to the following Smatch complaint:

    drivers/nvme/host/apple.c:1642 apple_nvme_remove()
    warn: variable dereferenced before check 'anv->ctrl.admin_q' (see line 1641)

drivers/nvme/host/apple.c
  1640		nvme_remove_namespaces(&anv->ctrl);
  1641		apple_nvme_disable(anv, true);
                                   ^^^
This dereferences anv->ctrl.admin_q

  1642		if (anv->ctrl.admin_q && !blk_queue_dying(anv->ctrl.admin_q)) {
                    ^^^^^^^^^^^^^^^^^
So this NULL check is pointless and can be removed.

  1643			/*
  1644			 * If the controller was reset during removal, it's possible

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
